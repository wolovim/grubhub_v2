require 'rails_helper'

describe 'when viewing the items' do
	context 'as a guest' do
		it 'should exist' do 
			visit items_path
			expect(page.status_code).to eq 200
		end

		it 'should see existing items' do
			Item.create(title: 'The Awesome Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4500)
			visit items_path
			expect(page).to have_content 'The Awesome Donut'
			expect(page).to have_content 'Clearly, the best donut you\'ve ever had.'
			#expect(page).to have_content '$45.00'
		end
	end
end