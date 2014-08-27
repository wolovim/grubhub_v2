class Item < ActiveRecord::Base
	validates :title, :description, :price, presence: true
	validates :title, uniqueness: true
	validates_numericality_of :price, greater_than_or_equal_to: 0
	has_many :item_categories
	has_many :categories, through: :item_categories
	has_many :orders, through: :order_items

	has_attached_file :image, styles: {:small => "150x150>", :thumb => "100x100>"}, default_url: "/assets/images/missing-donut.jpg"
	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}

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
end
