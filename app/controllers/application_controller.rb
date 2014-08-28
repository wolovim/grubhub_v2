class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user, :current_cart, :is_admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_cart
    if current_user
      items = session[:cart] || {}
      cart = Cart.find_or_initialize_by(user: current_user)
      cart.items ||= "{}"
      cart.items = items.to_json unless items.empty?
      cart.save
      @cart ||= cart
    else
      @cart ||= CartSession.new(session)
    end
  end

  def is_admin?
    current_user && current_user.role == 'admin'
  end

  def check_user
    unless current_user
      login_with_flash
    end
  end

  def check_admin
    unless is_admin?
      login_with_flash
    end
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  private

  def login_with_flash
    flash[:error] = 'You must be logged in to access that.'
    session[:last_page] = request.path
    redirect_to login_path
  end
end
