module ApplicationHelper
	def price_in_dollars(price)
		'$' + sprintf("%.2f", price / 100.00)
	end

  def get_update_button(status)
    status == 'ordered' ? 'Mark as Paid' : 'Mark as Completed'
  end

  def pending?(status)
    status == 'ordered' || status == 'paid'
  end

  def orders_by_status(status)
    count = 0
    Order.all.each { |order| count += 1 if order.status == status }
    count
  end

  def current_user_order(status)
    count = 0
    Order.current_orders(current_user).each { |order| count += 1 if order.status == status }
    count
  end

  def get_categories
    Category.all.map { |category| category.name }
  end

  def categories
    Category.all
  end

  def completed?(order)
    order.status == 'completed'
  end
end
