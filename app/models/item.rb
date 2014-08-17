class Item < ActiveRecord::Base
	validates :title, :description, :price, presence: true
	has_many :item_categories
	has_many :categories, through: :item_categories
	has_many :orders, through: :order_items

	has_attached_file :image, styles: {:small => "150x150>", :thumb => "100x100>"}
	validates_attachment :image, content_type: {content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]}
end