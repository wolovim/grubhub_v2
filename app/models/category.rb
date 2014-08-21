class Category < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
	has_many :item_categories
	has_many :items, through: :item_categories

  scope :with_items, -> { all.eager_load(:items).where('items.enabled' => true) }
end
