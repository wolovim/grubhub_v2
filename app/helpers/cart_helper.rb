module CartHelper
  def calculate_total
    current_cart.inject(0) do |sum, (id, quantity)|
      item = Item.find(id)
      sum += item_subtotal(item.id, item.price)
    end
  end

  def cart_count
    current_cart.inject(0) { |sum, (_, x)| sum + x }
  end
  
  def item_quantity(item_id)
    current_cart[item_id.to_s]
  end

  def item_subtotal(item_id, item_price)
    item_quantity(item_id) * item_price
  end
end
