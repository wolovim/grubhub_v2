class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = 'Registration successful. Congrats, you can use a keyboard.'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id]).decorate
  end

  def show
    @user = User.find(params[:id]).decorate
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :nickname)
  end

end
