class OrderItem < ActiveRecord::Base
	belongs_to :order
	belongs_to :item

	def item
		Item.find(self.item_id)
	end

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

	def update(params)
		self.unit_price = (params[:unit_price].to_d * 100).to_i
		self.quantity = params[:quantity]
		self.save
	end
end
