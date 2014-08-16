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

	def unit_price_dollars
		"$" + sprintf("%.2f", unit_price.to_f / 100)
	end
end
