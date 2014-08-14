require 'rails_helper'

describe 'when viewing the orders' do
	context 'as an admin' do
		# let(:user)  { User.create }
		let(:order)  { Order.create(user_id: 1, order_type: "pickup", address_id: 2, status: "completed", total: 2200) }

		before(:each) do
			order
			visit orders_path
		end

		it 'displays orders' do
			expect(page).to have_content("pickup")
			expect(page).to have_content("completed")
		end

		it 'can edit an order' do
			click_link "Edit"
			fill_in "Order type", with: "delivery"
			click_button "Update Order"
			expect(page).to have_content("delivery")
		end




		it "has link to cancel or mark as paid orders" do
			pending
			expect(page).to have_button('Mark as paid')
			expect(page).to have_button('Cancel')
		end

		it 'can cancel orders' do
			pending
			click_button("Cancel")
			expect(current_path).to eq(orders_path)
			expect(page).not_to have_content("pickup")
			expect(page).not_to have_content("ordered")
		end

		it 'can change status to paid' do
			pending
			click_button('Mark as paid')
			expect(current_path).to eq(orders_path)
			expect(page).to have_content('paid')
			expect(page).not_to have_content('ordered')
		end

	end
end