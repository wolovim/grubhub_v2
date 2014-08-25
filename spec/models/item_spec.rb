require 'rails_helper'

RSpec.describe Item, type: :model  do
	let(:item) { Item.new(title: 'Chocolate', description: 'with sprinkles', price: 100) }

	it 'is valid' do
		expect(item).to be_valid
	end

	it { should validate_presence_of(:title) }

	it { should validate_presence_of(:description) }

	it { should validate_presence_of(:price)}

	it { should validate_uniqueness_of(:title) }

	it 'has an array of categories' do
		expect(item.categories).to eq([])
	end
end
