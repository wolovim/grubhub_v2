require 'rails_helper'

describe 'when viewing the items' do

	let(:item) { Item.create(title: 'The Awesome Donut', description: 'Clearly, the best donut you\'ve ever had.', price: 4500) }

	context 'as an admin' do

		before(:each) do
			register_as_admin
			login_as_admin
			item
			visit admin_items_path
		end

		it 'should exist' do
			expect(page.status_code).to eq 200
		end

		it 'should see existing items' do
			expect(page).to have_content 'The Awesome Donut'
			expect(page).to have_content 'Clearly, the best donut you\'ve ever had.'
			expect(page).to have_content '$45.00'
		end

		it 'has a link to an item' do
			expect(page).to have_link 'The Awesome Donut', href: admin_item_path(item)
		end

		it 'links successfully to item' do
			click_link 'The Awesome Donut'
			expect(current_path).to eq(admin_item_path(item))
			expect(page).to have_content 'The Awesome Donut'
			expect(page).to have_content 'Clearly, the best donut you\'ve ever had.'
		end

		it 'shows the category associated with an item' do
			item = Item.create(title: "Shitty Donut", description: "A Mistake", price: 0)
			category = Category.create(name: "Savory")
			item.categories << category
			category.items << item
			visit admin_items_path
			expect(page).to have_content "Shitty Donut"
			expect(page).to have_content "Savory"
		end

		it 'links successfully to item' do
			click_link 'The Awesome Donut'
			expect(current_path).to eq(admin_item_path(item))
			expect(page).to have_content 'The Awesome Donut'
			expect(page).to have_content 'Clearly, the best donut you\'ve ever had.'
		end

		it 'shows the category associated with an item' do
			item = Item.create(title: "Shitty Donut", description: "A Mistake", price: 0)
			category = Category.create(name: "Savory")
			item.categories << category
			category.items << item
			visit admin_items_path
			expect(page).to have_content "Shitty Donut"
			expect(page).to have_content "Savory"
		end

		it 'can create a new item' do
			visit new_admin_item_path
			fill_in "Title", with: "Fancy New Donut"
			fill_in "Description", with: "It's pretty fancy"
			fill_in "Price", with: "800"
			click_button "Create Item"
			expect(current_path).to eq(admin_items_path)
			expect(page).to have_content 'Fancy New Donut'
			expect(page).to have_content "It's pretty fancy"
		end

		it 'can update an item' do
			item = Item.create(title: "OMG Donut", description: "Just like, wow.", price: 1800)
			visit edit_admin_item_path(item)
			fill_in "Title", with: "Fancy New Donut"
			fill_in "Description", with: "It's pretty fancy"
			fill_in "Price", with: "800"
			click_button "Update Item"
			expect(current_path).to eq(admin_items_path)
			expect(page).to have_content 'Fancy New Donut'
			expect(page).to have_content "It's pretty fancy"
			expect(page).not_to have_content 'OMG Donut'
			expect(page).not_to have_content "Just like, wow."
		end

		it 'can delete and item' do
			item = Item.create(title: "Shitty Donut", description: "A Mistake", price: 0)
			visit admin_item_path(item)
			click_link "Delete"
			expect(current_path).to eq(admin_items_path)
			expect(page).not_to have_content "Shitty Donut"
			expect(page).not_to have_content "A Mistake"
		end
	end
end
