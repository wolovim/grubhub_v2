class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item
	validates_numericality_of :unit_price, greater_than_or_equal_to: 0

	def item_title
		item.title
	end

	def subtotal
		"$" + sprintf("%.2f", (unit_price * quantity).to_f / 100)
	end

	def unit_price_decimal
		sprintf("%.2f", unit_price / 100.00)
	end

	def unit_price_dollars
		"$" + sprintf("%.2f", unit_price_decimal)
	end
end
