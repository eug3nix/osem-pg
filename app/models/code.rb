class Code < ActiveRecord::Base
  belongs_to :code_type
  has_and_belongs_to_many :conferences

  has_and_belongs_to_many :tickets, :join_table => :codes_tickets
  belongs_to :sponsor

  validates :name, :code_type_id, presence: true

end
