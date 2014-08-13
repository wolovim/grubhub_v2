require 'rails_helper'

describe 'when viewing the orders' do
	context 'as an admin' do
		# let(:user)  { User.create }
		let(:order  { Order.create(user_id: 1, order_type: "pickup", address_id: 2, status: "completed", total: 2200) }

		before(:each) do
			order
			visit orders_path
		end

		it 'displays orders' do
			expect(page).to have_content("pickup")
			expect(page).to have_content("completed")
		end

	end
end