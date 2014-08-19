class SessionsController < ApplicationController
  def new
  end

  def create
    if (user = User.find_by(email: params[:email])) && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session.delete(:last_page) || root_path
    else
      flash.now[:error] = 'Invalid username or password.'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
