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
			expect(page).to have_link('Change Status')
			expect(page).to have_link('Cancel')
		end

		it 'can cancel orders' do
			click_link("Cancel")
			expect(current_path).to eq(orders_path)
			expect(page).not_to have_content("completed")
			expect(page).to have_content("cancelled")
		end

		it 'can change status to paid' do
			pending
			order.status = 'paid'
			order.save
			click_link('Change Status')
			expect(current_path).to eq(orders_path)
			expect(page).to have_content('completed')
			expect(page).not_to have_content('paid')
		end

		it 'can change status to completed' do
			pending
			order.status = 'ordered'
			order.save
			click_link('Change Status')
			expect(current_path).to eq(orders_path)
			expect(page).to have_content('paid')
			expect(page).not_to have_content('ordered')
		end

		it 'shows Mark as Paid button for ordered status' do
			order.status = 'ordered'
			order.save
			visit orders_path
			binding.pry
			expect(page).to have_link('Mark as Paid')
			expect(page).not_to have_link('Mark as Completed')
		end
	end
end
