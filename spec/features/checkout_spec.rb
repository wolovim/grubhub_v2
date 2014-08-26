require 'rails_helper'

describe 'Checking out', type: :feature do
  context 'with a populated cart' do
    before(:each) do
      category = Category.create(name: 'Donuts')
      category.items.create(
        title: 'A Donut',
        description: 'This is a description',
        price: 1000,
        enabled: true
      )

      register
      login

      visit categories_path
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click
      visit new_order_path
    end

    it 'sees the cart items' do
      expect(page).to have_content 'A Donut'
      expect(page).to have_content '$30.00'
    end

    context 'ordering pickup' do
      context 'paying with cash' do
        it 'can create a new order' do
          choose 'Pickup'
          choose 'Cash'
          click_button 'Create Order'

          expect(page).to have_content 'Your order has been received.'
          expect(page).to have_content '$30.00'
        end
      end
    end
  end
end
