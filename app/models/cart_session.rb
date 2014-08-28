class CartSession
  include CartMethods

  attr_reader :cart

  def initialize(session)
    session[:cart] ||= {}
    @cart = session[:cart]
  end

  def save
  end

  def clear
    cart.clear
  end
end
