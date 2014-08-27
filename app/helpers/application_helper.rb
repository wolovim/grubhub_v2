module ApplicationHelper
	def price_in_dollars(price)
		'$' + sprintf("%.2f", price / 100.00)
	end

  def get_update_button(status)
    status == 'ordered' ? 'Mark as Paid' : 'Mark as Completed'
  end

  def orders_by_status(status)
    count = 0
    Order.all.each { |order| count += 1 if order.status == status }
    count
  end

	def format_date(date)
		date.to_time.strftime("%m/%d/%Y")
	end

	def format_time(time)
		time.to_time.strftime("%I:%M %p")
	end
end
