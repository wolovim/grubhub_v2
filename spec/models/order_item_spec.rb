require 'rails_helper'

RSpec.describe OrderItem, type: :model  do
  let(:item) { Item.create(title: 'Chocolate', description: 'with sprinkles', price: 100) }
  let(:order) { Order.create(user_id: 1, order_type: "delivery", address_id: 3, status: "ordered", total: 3300) }
  let(:order_item) { OrderItem.create(item_id: item.id, quantity: 2, unit_price: 30, order_id: order.id) }

  it 'can return item title' do
    expect(order_item.item_title).to eq('Chocolate')
  end

  it 'has a subtotal' do
    expect(order_item.subtotal).to eq("$0.60")
  end
end
