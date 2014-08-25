require 'rails_helper'

describe 'Shopping cart', type: :feature do
  before(:each) do
    category = Category.create(name: 'Donuts')
    category.items.create(
      title: 'A Donut',
      description: 'This is a description',
      price: 1000,
      enabled: true
    )
  end

  it 'can add an item to a cart' do
    visit categories_path
    first(:button, 'Add to Cart').click
    total_items = find('span.badge').text
    expect(total_items).to eq '1'
  end

  it 'can add the same item multiple times' do
    visit categories_path
    first(:button, 'Add to Cart').click
    first(:button, 'Add to Cart').click
    total_items = find('span.badge').text
    expect(total_items).to eq '2'
  end

  it 'cannot add an item that do not exist' do
    visit categories_path
    Item.destroy_all
    first(:button, 'Add to Cart').click
    expect(page).to have_content 'That item is no longer available.'
  end

  it 'cannot add an item that are disabled' do
    visit categories_path
    Item.first.update_column('enabled', false)
    first(:button, 'Add to Cart').click
    expect(page).to have_content 'That item is no longer available.'
  end

  it 'can view the cart' do
    visit categories_path
    first(:button, 'Add to Cart').click
    click_link 'View Cart'
    expect(page).to have_content 'A Donut'
    expect(page).to have_content '$10.00'
  end

  it 'can see the item quantity in the cart' do
    visit categories_path
    first(:button, 'Add to Cart').click
    first(:button, 'Add to Cart').click
    click_link 'View Cart'
    within('td.quantity') { expect(page).to have_content '2' }
  end

  it 'can remove an item from the cart' do
    visit categories_path
    first(:button, 'Add to Cart').click
    click_link 'View Cart'
    click_on 'Remove'
    expect(page).to have_content "'A Donut' has been removed from your cart."
    expect(page).to_not have_content '$10.00'
  end

  it 'can increase the quantity of an item' do
    visit categories_path
    first(:button, 'Add to Cart').click
    click_link 'View Cart'

    within('form.increment') {
      click_button '+'
    }

    within('td.quantity') { expect(page).to have_content '2' }
  end

  it 'can decrease the quantity of an item' do
    visit categories_path
    first(:button, 'Add to Cart').click
    first(:button, 'Add to Cart').click
    click_link 'View Cart'

    within('form.decrement') {
      click_button '-'
    }

    within('td.quantity') { expect(page).to have_content '1' }
  end

  it 'can remove an item by decreasing the quantity to 0' do
    visit categories_path
    first(:button, 'Add to Cart').click
    click_link 'View Cart'

    within('form.decrement') {
      click_button '-'
    }

    expect(page).to have_content "'A Donut' has been removed from your cart."
    expect(page).to_not have_content '$10.00'
  end

  it 'can see the subtotal' do
    visit categories_path
    first(:button, 'Add to Cart').click
    first(:button, 'Add to Cart').click
    click_link 'View Cart'
    expect(page).to have_content '$20.00'
  end
end
