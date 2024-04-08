class AccountsController < ApplicationController
  before_action :set_account, only: [ :update]

  def accountinformation
    @user = current_user
    @pets = @user.pets
  end

  def update
    if @account.update(account_params)
      redirect_to account_path, notice: 'Account information updated successfully.'
    else
      render :show
    end
  end

  private

  def set_account
    @account = current_user.account
  end

  def account_params
    params.require(:account).permit(:username, :bio)
  end
end
