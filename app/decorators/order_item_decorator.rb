class OrderItemDecorator < Draper::Decorator
  delegate_all

  delegate :title, to: :item, prefix: true

	def unit_price_dollars
    "$" + sprintf("%.2f", unit_price_decimal)
	end

	def unit_price_decimal
		sprintf("%.2f", unit_price / 100.00)
	end

	def subtotal
		"$" + sprintf("%.2f", (unit_price * quantity).to_f / 100)
	end
end
