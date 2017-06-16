class TicketPurchasesController < ApplicationController
  before_filter :authenticate_user!
  load_resource :conference, find_by: :short_title
  authorize_resource :conference_registrations, class: Registration

  def create
    current_user.ticket_purchases.by_conference(@conference).unpaid.destroy_all

    if params[:code_id].nil?
        code_id = ''
    else
        code_id = params[:code_id]
    end

    if params[:chosen_events].nil?
        chosen_events = Array.new
    else
        chosen_events = params[:chosen_events]
    end

    message = TicketPurchase.purchase(@conference, current_user, params[:tickets][0],
                                      code_id, chosen_events[0])
    if message.blank?
      if current_user.ticket_purchases.by_conference(@conference).unpaid.any?
        redirect_to new_conference_payment_path,
                    notice: 'Please pay here to get tickets.'
      else
        redirect_to conference_tickets_path(@conference.short_title),
                    error: 'Please get at least one ticket to continue.'
      end
    else
      redirect_to conference_conference_registration_path(@conference.short_title),
                  error: "Oops, something went wrong with your purchase! #{message}"
    end
  end

  private

  def ticket_purchase_params
    params.require(:ticket_purchase).permit(:ticket_id, :user_id, :conference_id, :quantity, :code_id, :event_id)
  end
end
