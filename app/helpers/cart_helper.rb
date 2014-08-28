module CartHelper
  def calculate_total
    total = current_cart.cart.inject(0) do |sum, (id, quantity)|
      item = Item.find(id)
      sum += item_subtotal_raw(item.id, item.price)
    end
    price_in_dollars(total)
  end

  def cart_count
    current_cart.cart.inject(0) { |sum, (_, x)| sum + x }
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
