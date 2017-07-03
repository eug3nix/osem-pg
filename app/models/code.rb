class Code < ActiveRecord::Base
  belongs_to :conference
  belongs_to :code_type
  has_and_belongs_to_many :conferences, :join_table => :conferences_codes

  has_and_belongs_to_many :tickets, :join_table => :codes_tickets
  belongs_to :sponsor

  validates :name, :code_type_id, presence: true
  validates :max_uses, numericality: { greater_than_or_equal_to: 0 }
  validates :discount, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 100}

end
