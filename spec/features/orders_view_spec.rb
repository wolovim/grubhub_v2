require 'rails_helper'

describe 'when viewing the orders' do
	context 'as an admin' do
		# let(:user)  { User.create }
		let(:order)  { Order.create(user_id: 1, order_type: "pickup", address_id: 2, status: "ordered", total: 2200) }
		let(:item) { Item.create(title: 'The Awesome Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4300) }
		let(:order_item) { OrderItem.create(order_id: order.id, item_id: item.id, quantity: 2, unit_price: 210) }

		before(:each) do
			order
			item
			order_item
			visit orders_path
		end

		it 'displays orders' do
			expect(page).to have_content("pickup")
			expect(page).to have_content("ordered")
		end

		it 'can edit an order' do
			click_link "Edit"
			fill_in "Order type", with: "delivery"
			click_button "Update Order"
			expect(page).to have_content("delivery")
		end

		it "has link to cancel or mark as paid orders" do
			expect(page).to have_link('Cancel')
		end

		it 'can cancel orders' do
			click_link("Cancel")
			expect(current_path).to eq(orders_path)
			expect(page).not_to have_content("ordered")
			expect(page).to have_content("cancelled")
		end

		it 'can change status to paid' do
			order.status = 'paid'
			order.save
			visit orders_path
			click_link('Mark As Completed')
			expect(current_path).to eq(orders_path)
			expect(page).to have_content('completed')
			expect(page).not_to have_content('paid')
		end

		it 'can change status to completed' do
			visit orders_path
			click_link('Mark As Paid')
			expect(current_path).to eq(orders_path)
			expect(page).to have_content('paid')
			expect(page).not_to have_content('ordered')
		end

		it 'does not show an update button for completed status' do
			order.status = 'completed'
			order.save
			visit orders_path
			expect(page).not_to have_link('Mark As Paid')
			expect(page).not_to have_link('Mark As Completed')
		end

		it 'does not show an update button for cancelled status' do
			order.status = 'cancelled'
			order.save
			visit orders_path
			expect(page).not_to have_link('Mark As Paid')
			expect(page).not_to have_link('Mark As Completed')
		end

		it 'can filter items by status' do

		end

		it 'can remove items from an order' do
			expect(order.items).to eq([item])
			click_link('Edit')
			expect(page).to have_content('The Awesome Donut')
			expect(current_path).to eq(edit_order_path(order))
			click_link('Remove')
			expect(current_path).to eq(edit_order_path(order))
			expect(page).not_to have_content('The Awesome Donut')
		end

		it 'shows total number of orders by status' do
			expect(page).to have_content("Ordered: 1")
			expect(page).to have_content("Paid: 0")
			expect(page).to have_content("Completed: 0")
			expect(page).to have_content("Cancelled: 0")
		end
	end
end
