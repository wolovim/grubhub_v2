module ApplicationHelper
	def price_in_dollars(price)
		'$' + price_in_decimal(price)
	end

  def price_in_decimal(price)
    sprintf("%.2f", price / 100.00)
  end

  def orders_by_status(status)
    Order.where(status: status).size
  end

	def categories
		Category.all
	end

	def display_name(user)
		user.nickname ? user.nickname : user.first_name
	end
end
