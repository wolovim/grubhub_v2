require 'rails_helper'

describe 'when viewing the items' do
	context 'as a guest' do
		let(:item) { Item.create(title: 'The Awesome Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4500) }

		before(:each) do
			item
			visit items_path
		end

		it 'should exist' do 
			expect(page.status_code).to eq 200
		end

		it 'should see existing items' do
			expect(page).to have_content 'The Awesome Donut'
			expect(page).to have_content 'Clearly, the best donut you\'ve ever had.'
			#expect(page).to have_content '$45.00'
		end

		it 'has a link to an item' do
			expect(page).to have_link 'The Awesome Donut', href: item_path(item)
		end

		it 'links successfully to item' do
			click_link 'The Awesome Donut'
			expect(current_path).to eq(item_path(item))
			expect(page).to have_content 'The Awesome Donut'
			expect(page).to have_content 'Clearly, the best donut you\'ve ever had.'
		end

	end
end