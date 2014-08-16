class Order < ActiveRecord::Base
	validates :user_id, :order_type, :address_id, :status, :total, presence: true
	has_many :order_items
	has_many :items, through: :order_items

	def update_status
		self.status == 'ordered' ? self.status = 'paid' : self.status = 'completed'
		self.save
	end

	def cancel
		self.status = 'cancelled'
		self.save
	end
end
