require 'rails_helper'

RSpec.describe Category, type: :model do
	let(:category) { Category.new(name: 'Savory') }

	it 'is valid' do
		expect(category).to be_valid
	end

	it { should validate_presence_of(:name) }
end
