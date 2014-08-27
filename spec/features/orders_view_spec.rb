require 'rails_helper'

describe 'when viewing the orders' do
  before(:each) do
    User.create(email: 'yourdad123@aol.com', first_name: 'your', last_name: 'dad', password: '123', password_confirmation: '123', role: 'admin')
    login_as_admin
  end

	context 'as an admin' do
    let(:address) { Address.create(street: '1 Blake St', city: 'Denver', state: 'CO', zip: '80000') }
		let(:order)  { Order.create(user_id: 1, order_type: "pickup", address_id: 1, status: "ordered", total: 2200) }
		let(:item) { Item.create(title: 'The Awesome Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4300) }
		let(:order_item) { OrderItem.create(order_id: order.id, item_id: item.id, quantity: 2, unit_price: 210) }

		before(:each) do
			order
			item
			order_item
      address
			visit admin_orders_path
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
			expect(current_path).to eq(admin_orders_path)
			expect(page).not_to have_content("ordered")
			expect(page).to have_content("cancelled")
		end

		it 'can change status to paid' do
			order.status = 'paid'
			order.save
			visit admin_orders_path
			click_link('Mark as Completed')
			expect(current_path).to eq(admin_orders_path)
			expect(page).to have_content('completed')
			expect(page).not_to have_content('paid')
		end

		it 'can change status to completed' do
			visit admin_orders_path
			click_link('Mark as Paid')
			expect(current_path).to eq(admin_orders_path)
			expect(page).to have_content('paid')
			expect(page).not_to have_content('ordered')
		end

		it 'does not show an update button for completed status' do
			order.status = 'completed'
			order.save
			visit admin_orders_path
			expect(page).not_to have_link('Mark As Paid')
			expect(page).not_to have_link('Mark As Completed')
		end

		it 'does not show an update button for cancelled status' do
			order.status = 'cancelled'
			order.save
			visit admin_orders_path
			expect(page).not_to have_link('Mark As Paid')
			expect(page).not_to have_link('Mark As Completed')
		end

		it 'can remove items from an order' do
			expect(order.items).to eq([item])
			click_link('Edit')
			expect(page).to have_content('The Awesome Donut')
			expect(current_path).to eq(edit_admin_order_path(order))
			click_link('Remove')
			expect(current_path).to eq(edit_admin_order_path(order))
			expect(page).not_to have_content('The Awesome Donut')
		end

		it 'shows links to filter orders by status' do
			expect(page).to have_link('Ordered')
			expect(page).to have_link('Paid')
			expect(page).to have_link('Completed')
			expect(page).to have_link('Cancelled')
		end

		it 'filters by ordered status' do
			order2 =  Order.create(user_id: 1, order_type: "delivery", address_id: 2, status: "paid", total: 2200)
			item2 = Item.create(title: 'The Paid Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4300)
			order_item2 = OrderItem.create(order_id: order2.id, item_id: item2.id, quantity: 2, unit_price: 210)
			click_link('Ordered')
			expect(page).not_to have_content('delivery')
			expect(page).to have_content('pickup')
		end

		it 'filters by paid status' do
			order.status = 'completed'
			order.save
			visit admin_orders_path
			order2 =  Order.create(user_id: 1, order_type: "delivery", address_id: 2, status: "paid", total: 2200)
			item2 = Item.create(title: 'The Paid Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4300)
			order_item2 = OrderItem.create(order_id: order2.id, item_id: item2.id, quantity: 2, unit_price: 210)
			click_link('Paid')
			expect(page).to have_content('delivery')
			expect(page).not_to have_content('pickup')
		end

		it 'filters by completed status' do
			order2 =  Order.create(user_id: 1, order_type: "delivery", address_id: 2, status: "completed", total: 2200)
			item2 = Item.create(title: 'The Paid Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4300)
			order_item2 = OrderItem.create(order_id: order2.id, item_id: item2.id, quantity: 2, unit_price: 210)
			click_link('Completed')
			expect(page).to have_content('delivery')
			expect(page).not_to have_content('pickup')
		end

		it 'filters by cancelled status' do
			order2 =  Order.create(user_id: 1, order_type: "delivery", address_id: 2, status: "cancelled", total: 2200)
			item2 = Item.create(title: 'The Paid Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4300)
			order_item2 = OrderItem.create(order_id: order2.id, item_id: item2.id, quantity: 2, unit_price: 210)
			click_link('Cancelled')
			expect(page).to have_content('delivery')
			expect(page).not_to have_content('pickup')
		end

    it 'can see customer name from orders page' do
      expect(page).to have_content('your dad')
    end

    it 'can see email address and customer name on details page' do
      click_link 'Details'
      expect(page).to have_content('your dad')
      expect(page).to have_content('yourdad123@aol.com')
    end

    it 'shows the address for delivery orders' do
      order.order_type = 'delivery'
      order.save
      visit admin_orders_path
      click_link 'Details'
      expect(page).to have_content('1 Blake St, Denver, CO 80000')
    end

    it 'does not show address for pickup orders' do
      click_link 'Details'
      expect(page).not_to have_content('1 Blake St, Denver, CO 80000')
    end
	end
end
