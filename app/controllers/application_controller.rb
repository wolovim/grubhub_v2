class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    User.find(session[:user_id]) if session[:user_id]
  end

  def check_admin
    user = current_user || User.new(role: 'guest')

    unless user.role == 'admin'
      flash[:error] = 'You must be logged in to access that.'
      session[:last_page] = request.path
      redirect_to login_path
    end
  end
end
