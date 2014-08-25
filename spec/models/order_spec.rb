require 'rails_helper'

RSpec.describe Order, type: :model  do
	let(:order) { Order.new(user_id: 1, order_type: "delivery", address_id: 3, status: "ordered", total: 3300) }

	it 'is valid' do
		expect(order).to be_valid
	end

	it { should validate_presence_of(:user_id) }

	it { should validate_presence_of(:order_type) }

	it { should validate_presence_of(:address_id) }

	it { should validate_presence_of(:status) }

	it 'has an array of order items' do
		expect(order.order_items).to eq([])
	end

	it 'has an array of items' do
		expect(order.items).to eq([])
	end

	it 'can update the status from ordered to paid' do
		order.update_status
		expect(order.status).to eq('paid')
	end

	it 'can cancel the status' do
		order.cancel
		expect(order.status).to eq('cancelled')
	end

	it 'can update the status from paid to completed' do
		order2 = Order.new(user_id: 2, order_type: "delivery", address_id: 4,
			status: "paid", total: 300)
		order2.update_status
		expect(order2.status).to eq('completed')
	end

	it 'can have an item removed' do
		item = Item.create(title: 'The Awesome Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4500)
		order.items << item
		expect(order.items).to eq([item])

		order.remove_item(1)
		expect(order.items).to eq([])
	end

	it 'can return all orders with ordered status' do
		example = Order.create(user_id: 1, order_type: "delivery", address_id: 3, status: "ordered", total: 3300)

		expect(Order.all_ordered).to eq([example])
	end

	it 'can return all orders with ordered status' do
		example = Order.create(user_id: 1, order_type: "delivery", address_id: 3, status: "paid", total: 3300)

		expect(Order.all_paid).to eq([example])
	end

	it 'can return all orders with completed status' do
		example = Order.create(user_id: 1, order_type: "delivery", address_id: 3, status: "completed", total: 3300)

		expect(Order.all_completed).to eq([example])
	end

	it 'can return all orders with cancelled status' do
		example = Order.create(user_id: 1, order_type: "delivery", address_id: 3, status: "cancelled", total: 3300)

		expect(Order.all_cancelled).to eq([example])
	end
end
