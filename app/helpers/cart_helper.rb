module CartHelper
  def calculate_total
    total = current_cart.total
    price_in_dollars(total)
  end

  def cart_count
    current_cart.count
  end
  
  def item_quantity(item_id)
    current_cart.quantity(item_id.to_s)
  end

  def item_subtotal_raw(item_id, item_price)
    item_quantity(item_id) * item_price
  end

  def item_subtotal(item_id, item_price)
    price_in_dollars(item_subtotal_raw(item_id, item_price))
  end
end
