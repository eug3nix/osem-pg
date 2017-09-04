class TicketPurchase < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :user
  belongs_to :conference

  belongs_to :code
  belongs_to :event

  belongs_to :payment

  validates :ticket_id, :user_id, :conference_id, :quantity, presence: true

  validates_numericality_of :quantity, greater_than: 0

  delegate :title, to: :ticket
  delegate :description, to: :ticket
  delegate :price, to: :ticket
  delegate :adjusted_price, to: :ticket
  delegate :price_cents, to: :ticket
  delegate :price_currency, to: :ticket

  scope :paid, -> { where(paid: true) }
  scope :unpaid, -> { where(paid: false) }
  scope :by_conference, -> (conference) { where(conference_id: conference.id) }
  scope :by_user, -> (user) { where(user_id: user.id) }

  def self.total_payments(conference, ticket)
    total_paid = TicketPurchase.where(ticket_id: ticket.id, paid: true,
                         conference_id: conference.id).joins(:payment).sum(:amount)

    Money.new(total_paid, conference.default_currency)
  end

  def self.purchase(conference, user, purchases, code_id, chosen_events)
    errors = []
    ActiveRecord::Base.transaction do
      conference.tickets.each do |ticket|
        chosen_event_id = nil
        if chosen_events.present?
          chosen_events.each do |key, value|
            if key == ticket.id.to_s
              chosen_event_id = value
            end
          end
        end

        quantity = purchases[ticket.id.to_s].to_i
        # if the user bought the ticket, just update the quantity
        if ticket.bought?(user) && ticket.unpaid?(user)
          purchase = update_quantity(conference, quantity, ticket, user)
        else
          purchase = purchase_ticket(conference, quantity, ticket, user, code_id, chosen_event_id)
        end

        if purchase && !purchase.save
          errors.push(purchase.errors.full_messages)
        end
      end
    end
    errors.join('. ')
  end

  def self.purchase_ticket(conference, quantity, ticket, user, code_id, event_id)

    purchase = new(ticket_id: ticket.id,
                   conference_id: conference.id,
                   user_id: user.id,
                   quantity: quantity,
                   code_id: code_id,
                   event_id: event_id) if quantity > 0
    purchase
  end

  def self.update_quantity(conference, quantity, ticket, user)
    purchase = TicketPurchase.where(ticket_id: ticket.id,
                                    conference_id: conference.id,
                                    user_id: user.id,
                                    paid: false).first

    purchase.quantity = quantity if quantity > 0
    purchase
  end

  def self.get_code_usage(conference, code)
    usage = TicketPurchase.where(conference_id: conference.id, code_id: code.id).sum(:quantity)
    usage
  end
end
