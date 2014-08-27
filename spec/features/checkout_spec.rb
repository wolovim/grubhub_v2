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

      context 'paying with credit card' do
        it 'can create a new order' do
          choose 'Pickup'
          choose 'Credit Card'
          click_button 'Create Order'

          expect(page).to have_content 'Your order has been received.'
          expect(page).to have_content '$30.00'
        end
      end
    end

    context 'ordering delivery' do
      context 'paying with cash' do
        it 'can add a new address' do
          user = User.first

          choose 'Delivery'

          choose 'Enter a new address'
          fill_in 'Street', with: '123 Fake St.'
          fill_in 'Unit', with: '#307'
          fill_in 'City', with: 'Broomfield'
          fill_in 'State', with: 'CO'
          fill_in 'Zip', with: '80021'

          choose 'Cash'
          click_button 'Create Order'

          expect(page).to have_content 'Your order has been received.'
          expect(page).to have_content '$30.00'
          expect(user.addresses.count).to eq 1
        end
      end

      context 'paying with credit card' do
        it 'can create a new order' do
          skip # Credit cards are ignored right now.
               # If we add Stripe, this needs to be changed.
          choose 'Delivery'
          choose 'Credit Card'
          click_button 'Create Order'

          expect(page).to have_content 'Your order has been received.'
          expect(page).to have_content '$30.00'
        end
      end

      it 'can pick an existing address' do
      end
    end
  end
end
