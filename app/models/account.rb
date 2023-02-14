class Account < ApplicationRecord
  validates :firstName, :secondName, :age , presence: true
  validates :balance , :numericality => {:greater_than => -1}, :on => :update

  #has_one :user
  belongs_to :user
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
