class Account < ApplicationRecord
  validates :firstName, :secondName, :age , presence: true
  #validates :balance , numericality: true#, greater_than: -1

  #has_one :user
  belongs_to :user

  @deposit = 0
  @withdraw = 0
  # def deposit(number)
  #   changedBalance = @account.balance + number
  #   @account.update(balance: changedBalance)
  #   redirect_to user_session_path
  # end
  #
  # def withdraw(number)
  #   changedBalance = @account.balance - number
  #   @account.update(balance: changedBalance)
  #   redirect_to user_session_path
  # end
end
