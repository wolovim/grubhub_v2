class Order < ActiveRecord::Base
  before_validation :set_default_values
	validates :user_id, :order_type, :total, presence: true

	has_many :order_items
	has_many :items, through: :order_items
  belongs_to :user
  belongs_to :address
  accepts_nested_attributes_for :address, reject_if: :pickup_or_existing_address

  scope :ordered, -> { where(status: 'ordered') }
  scope :paid, -> { where(status: 'paid') }
  scope :completed, -> { where(status: 'completed') }
  scope :cancelled, -> { where(status: 'cancelled') }
  scope :current_orders, ->(user) { where(user: user) }

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

  private

  def reject_from_items(item_id)
    items.reject { |item| item.id == item_id.to_i }
  end
end
