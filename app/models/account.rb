class Account < ApplicationRecord
  validates :firstName, :secondName, :age , presence: true
  validates :balance , numericality: true#, greater_than: -1

  #has_one :user
  belongs_to :user
end
