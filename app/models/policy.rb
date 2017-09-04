class Policy < ActiveRecord::Base
  has_and_belongs_to_many :conferences

  validates :title, presence: true
end
