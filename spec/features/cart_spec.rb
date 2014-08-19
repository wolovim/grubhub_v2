require 'rails_helper'

describe 'Shopping cart', type: :feature do
  before(:each) do
    category = Category.create(name: 'Donuts')
    category.items.create(
      title: 'A Donut',
      description: 'This is a description',
      price: 1000
    )
  end

  it 'can add items to a cart' do
    visit categories_path
    first(:button, 'Add to Cart').click 
    total_items = find('span.badge').text
    expect(total_items).to eq '1'
  end
end
