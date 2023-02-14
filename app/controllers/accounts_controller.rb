class AccountsController < ApplicationController

  def index
    if current_user.account != nil
    @account = current_user.account
    else
      new
    end
  end

  def show
    @account = current_user.account
  end

  def new
    if current_user.account == nil
    @account = Account.new
    else
      redirect_to accounts_path
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update

  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to user_session_path
  end
end