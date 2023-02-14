class AccountsController < ApplicationController
  def show
    @account = Account.find(params[:id])
  end

  def new
    @account = Account.new
    @account.firstName = "ASAADA"
    @account.secondName = "ASAADA"
    @account.age = 12
    @account.balance = 32932
    @account.save

  end

  def edit
    @account = Account.find(params[:id])
  end

  def update

  end

  def destroy
    Account.destroy(params[:id])
  end
end