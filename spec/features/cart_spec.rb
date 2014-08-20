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

  it 'can add items to a cart' do
    visit categories_path
    first(:button, 'Add to Cart').click
    total_items = find('span.badge').text
    expect(total_items).to eq '1'
  end

  it 'cannot add items that do not exist' do
    visit categories_path
    Item.destroy_all
    first(:button, 'Add to Cart').click
    expect(page).to have_content 'That item is no longer available.'
  end

  it 'cannot add items that are disabled' do
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
end
