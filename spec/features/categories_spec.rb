require 'rails_helper'

describe 'when viewing the categories' do
	context 'as a admin' do

		let(:category) { Category.create(name: 'Savory') }

		before(:each) do
			category
			visit categories_path
		end

		it 'can view categories' do
			expect(page).to have_content("Savory")
		end

		it 'has a link to edit' do
			expect(page).to have_link('edit')
		end

		it 'can edit a category' do
			click_link 'edit'
			fill_in "Name", with: "Changed Donut"
			click_button 'Update'
			expect(page).to have_content("Changed Donut")
		end

	end
end