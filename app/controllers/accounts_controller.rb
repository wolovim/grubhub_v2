class AccountsController < ApplicationController
  before_filter :check_user

  def show
    @user = current_user.decorate
  end

  def edit
    @user = current_user.decorate
  end

  def update
    @user = current_user.decorate
    if @user.update(user_params)
      redirect_to account_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :nickname)
  end
end
