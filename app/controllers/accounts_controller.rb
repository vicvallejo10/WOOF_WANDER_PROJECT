class AccountsController < ApplicationController
  before_action :set_account, only: [:update]

  def index
  end

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

  def update_avatar
    @user = User.find(current_user.id)
    puts @user, "User------------------"
    @user.update(avatar_params)
    redirect_to accountinformation_path
  end

  private

  def set_account
    @account = current_user.account
  end

  def account_params
    params.require(:account).permit(:username, :bio)
  end

  def avatar_params
    params.require(:user).permit(:avatar)
  end
end
