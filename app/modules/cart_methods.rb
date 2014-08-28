module CartMethods
  def new_items
    @new_items ||= []
  end
  
  def empty?
    cart.empty?
  end

  def count
    cart.inject(0) { |sum, (_, x)| sum + x }
  end

  def total
    cart.inject(0) do |sum, (id, quantity)|
      item = Item.find(id)
      sum += item.price * quantity
    end
  end

  def store(item_id, amount)
    item_id = item_id.to_s

    new_items << item_id unless exists?(item_id)
    cart.store(item_id, quantity(item_id) + amount)

    if quantity(item_id) <= 0
      delete(item_id)
    end
  end

  def quantity(item_id)
    cart.fetch(item_id.to_s, 0)
  end

  def delete(item_id)
    cart.delete(item_id.to_s)
  end

  def new?(item_id)
    new_items.any? { |x| x == item_id.to_s }
  end

  def exists?(item_id)
    cart.has_key?(item_id.to_s)
  end

  def keys
    cart.keys
  end

  def each
    if block_given?
      cart.each { |x| yield(x) }
    end
  end
end
