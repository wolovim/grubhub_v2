require 'rails_helper'

RSpec.describe Order, type: :model  do
	let(:order) { Order.new(user_id: 1, order_type: "delivery", address_id: 3, status: "ordered", total: 3300) }

	it 'is valid' do
		expect(order).to be_valid
	end

	it 'is invalid without a user_id' do
		order.user_id = nil
		expect(order).not_to be_valid
	end

	it 'is invalid without a order_type' do
		order.order_type = nil
		expect(order).not_to be_valid
	end

	it 'is invalid without a address_id' do
		order.address_id = nil
		expect(order).not_to be_valid
	end

	it 'is invalid without a status' do
		order.status = nil
		expect(order).not_to be_valid
	end

	it 'is invalid without a total' do
		order.total = nil
		expect(order).not_to be_valid
	end

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
end
