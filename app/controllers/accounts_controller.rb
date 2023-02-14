class AccountsController < ApplicationController
  def index
      if current_user.account != nil
        @user = User.find_by(id: session[:user_id])
        @account = current_user.account
      else
        @user = User.find_by(id: session[:user_id])
        render :new
      end
  end


  # def create
  #   @account = Account.new(account_params)
  #
  #   respond_to do |format|
  #     if @account.save
  #       format.html { redirect_to accounts_path, notice: 'User was successfully created.' }
  #       format.json { render :index, status: :created, location: @account }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @account.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @account = Account.new(account_params)
    @user = User.find_by(id: session[:user_id])
    if @account.save
      @account.user_id = @user.id
      @user.account_id = @account.id
      @user.save
      redirect_to accounts_path
    else
      #redirect_to new_account_path
    end
  end

  def new
    # if current_user.account == nil
      @account = Account.new
    # else
    #   redirect_to accounts_path
    # end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)

      @account.update(balance: (@account.balance + 12)) if deposit?
      @account.update(balance: (@account.balance - 12)) if withdraw?
      flash[:notice] = "Update success"
      redirect_to accounts_path
    else
      render :edit
    end

  end

  def destroy
    @account = Account.find(params[:id])
    @account.destroy
    redirect_to user_session_path
  end

  def deposit?
    params[:commit] == "Deposit"
  end

  def withdraw?
    params[:commit] == "Withdraw"
  end

  def account_params
    params.require(:account).permit(:firstName, :secondName, :age, :balance)
  end
end