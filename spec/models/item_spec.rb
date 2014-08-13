require 'rails_helper'

RSpec.describe Item, type: :model  do
	let(:item) { Item.new(title: 'Chocolate', description: 'with sprinkles', price: 100) }

	it 'is valid' do
		expect(item).to be_valid
	end

	it 'is invalid without a name' do
		item.title = nil
		expect(item).not_to be_valid
	end

	it 'is invalid without a description' do
		item.description = nil
		expect(item).not_to be_valid
	end

	it 'is invalid without a price' do
		item.price = nil
		expect(item).not_to be_valid
	end

	it 'has an array of categories' do 
		expect(item.categories).to eq([])
	end
end