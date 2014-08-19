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
			expect(page).to have_link('Edit')
		end

		it 'can edit a category' do
			click_link 'Edit'
			fill_in "Name", with: "Changed Donut"
			click_button 'Update Category'
			expect(page).to have_content("Changed Donut")
		end

		it 'has a link to add a category' do
			expect(page).to have_button('Add Category')
		end

		it 'can add a category' do
			click_button 'Add Category'
			fill_in "Name", with: 'New Category'
			click_button 'Create Category'
			expect(page).to have_content('New Category')
		end

		it 'can delete a category' do
			click_link "Delete"
			expect(page).not_to have_content("Savory")
		end
	end
end
