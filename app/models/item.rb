class Item < ActiveRecord::Base
	validates :title, :description, :price, presence: true
	validates :title, uniqueness: true
	has_many :item_categories
	has_many :categories, through: :item_categories
	has_many :orders, through: :order_items

	has_attached_file :image, styles: {:small => "150x150>", :thumb => "100x100>"}
	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}

	def display_categories
		self.categories.map { |c| c.name }.join(', ')
	end

	def price_in_dollars
		'$' + sprintf("%.2f", price / 100.00)
	end

	def remove_category(category_id)
		self.categories = categories.reject { |category| category.id == category_id.to_i}
		self.save
	end

	def retired?
		enabled == false
	end

	def retire
		self.enabled = !enabled
		self.save
	end

	def unit_price_decimal
		sprintf("%.2f", price / 100.00)
	end
end
