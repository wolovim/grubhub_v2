class Order < ActiveRecord::Base
  before_validation :set_default_values
	validates :user_id, :order_type, :payment_type, presence: true

	has_many :order_items
	has_many :items, through: :order_items
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address, reject_if: :pickup_or_existing_address

  scope :user_and_oi, -> { includes([:user, :order_items]) }
  scope :ordered, -> { user_and_oi.where(status: 'ordered') }
  scope :paid, -> { user_and_oi.where(status: 'paid') }
  scope :completed, -> { user_and_oi.where(status: 'completed') }
  scope :cancelled, -> { user_and_oi.where(status: 'cancelled') }
  scope :current_orders, ->(user) { includes(:order_items).where(user: user) }

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
  end

  def total
    @total ||= order_items.inject(0) { |sum, order_item| sum += (order_item.unit_price * order_item.quantity) }
  end

	def update_status
    if ordered?
      update_attribute(:status, 'paid')
    else
      update_attribute(:status, 'completed')
    end
	end

	def cancel
    update_attribute(:status, 'cancelled')
	end

	def remove_item(item_id)
    update_attribute(:items, reject_from_items(item_id))
	end

  def ordered?
    status == 'ordered'
  end

  def paid?
    status == 'paid'
  end

  def pending?
    ordered? || paid?
  end

	def delivery?
		order_type == 'delivery'
	end

  def pickup?
    !delivery?
  end

  def pickup_or_existing_address
    pickup? || address_id
  end

  def total_wait_time
    # each paid order causes 4 min delay
    num_paid = Order.paid.size
    # order is delayed by 10 minutes for each additional six items
    order_size_delay = items.count / 6
    # 12 mins is default wait time
    minutes = 12 + num_paid * 4 + order_size_delay * 10
  end

  def current_wait_time
    wait_time = total_wait_time - (Time.now - created_at) / 60
    if wait_time > 0
      "#{wait_time.round} minutes until ready for pickup"
    else
      "ready for pickup"
    end
  end

  private

  def reject_from_items(item_id)
    items.reject { |item| item.id == item_id.to_i }
  end
end
