require 'rails_helper'

RSpec.describe Order, type: :model  do
	let(:order) { Order.new(user_id: 1, order_type: "delivery", address_id: 3, status: "completed", total: 3300) }

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
end