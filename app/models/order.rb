class Order < ActiveRecord::Base
	validates :user_id, :order_type, :status, :total, presence: true
  validates :address_id, presence: true, if: :delivery?
	has_many :order_items
	has_many :items, through: :order_items

  before_validation :set_default_values

	def self.all_ordered
		all.select { |order| order.status == 	'ordered' }
	end

	def self.all_paid
		all.select { |order| order.status == 	'paid' }
	end

	def self.all_completed
		all.select { |order| order.status == 	'completed' }
	end

	def self.all_cancelled
		all.select { |order| order.status == 	'cancelled' }
	end

	def self.current_orders(current_user)
		all.select { |order| order.user_id == current_user.id }
	end

  def self.new_with_items(params, cart)
    order = new(params)
    items = Item.where(id: cart.keys)
    cart.each do |item, quantity|
      order.order_items.new(item_id: item,
                            quantity: quantity,
                            unit_price: items.detect { |x| x.id == item.to_i }.price)
    end
    order
  end

  def set_default_values
    self.status ||= 'ordered'
    self.total ||= 0
  end

	def update_status
		self.status == 'ordered' ? self.status = 'paid' : self.status = 'completed'
		self.save
	end

	def cancel
		self.status = 'cancelled'
		self.save
	end

	def remove_item(item_id)
		self.items = items.reject { |item| item.id == item_id.to_i }
		self.save
	end

	def customer_name
		user = User.find(self.user_id)
		user.first_name + ' ' + user.last_name
	end

	def customer_email
		user = User.find(self.user_id)
		user.email
	end

	def total
		pretax_total = self.order_items.inject(0) { |sum, order_item| sum + order_item.quantity * order_item.unit_price }
		"$" + sprintf("%.2f", (pretax_total += pretax_total * 0.07) / 100)
	end

	def delivery?
		order_type == 'delivery'
	end

	def address
		data = Address.find(self.address_id)
		location = [data[:street], data[:city], data[:state], data[:zip]]
		location.join(', ')
	end
end
