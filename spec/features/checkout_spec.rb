require 'rails_helper'

describe 'Checking out', type: :feature do
  context 'with an empty cart' do
    it 'sees an error message' do
      register
      login
      visit new_order_path
      expect(page).to have_content 'Your cart is empty.'
    end
  end

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

      address

      visit categories_path
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click
      first(:button, 'Add to Cart').click

      visit new_order_path
    end

    let(:user) { User.first }
    let(:address) { 
      user.addresses.create(
        street: '123 Fake St.', unit: '#307', city: 'Broomfield', state: 'CO', zip: 80021
      ).decorate
    }

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
        it 'can create a new order', js: true do
          choose 'Pickup'
          choose 'Credit Card'

          fill_in :credit_card, with: 4242424242424242
          fill_in :exp_year, with: 2015
          fill_in :exp_month, with: 2
          fill_in :cvv, with: 123

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
          expect(user.addresses.count).to eq 2
        end

        it 'can select an existing address' do
          choose 'Delivery'
          choose 'Select a saved address'
          select '123 Fake St. #307, Broomfield, CO 80021'
          choose 'Cash'
          click_button 'Create Order'

          expect(page).to have_content 'Your order has been received.'
          expect(page).to have_content '$30.00'
          expect(page).to have_content address
        end
      end

      context 'paying with credit card' do
        it 'can create a new order' do
          skip
          choose 'Delivery'
          choose 'Select a saved address'
          select '123 Fake St. #307, Broomfield, CO 80021'
          choose 'Credit Card'

          fill_in :credit_card, with: 4242424242424242
          fill_in :exp_year, with: 2015
          fill_in :exp_month, with: 2
          fill_in :cvv, with: 123

          click_button 'Create Order'

          expect(page).to have_content 'Your order has been received.'
          expect(page).to have_content '$30.00'
          expect(page).to have_content address
        end
      end
    end
  end
end
