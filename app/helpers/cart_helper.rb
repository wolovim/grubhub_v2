module CartHelper
  def cart_count
    current_cart.inject(0) { |sum, (_, x)| sum + x }
  end
  
  def item_quantity(item_id)
    current_cart[item_id.to_s]
  end

  def item_subtotal(item_id, item_price)
    price_in_dollars(item_quantity(item_id) * item_price)
  end
end
