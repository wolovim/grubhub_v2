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

	def format_date(date)
		date.to_time.strftime("%m/%d/%Y")
	end

	def format_time(time)
		time.to_time.strftime("%I:%M %p")
	end
end
