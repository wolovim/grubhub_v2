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

		it	'cannot create an item without a title' do
			visit new_admin_item_path
			fill_in "Title", with: ""
			fill_in "Description", with: "It's pretty fancy"
			fill_in "Price", with: "800"
			click_button "Create Item"
			expect(current_path).to eq(admin_items_path)
			expect(page).to have_content 'blank'
		end

		it'cannot create an item without a description' do
			visit new_admin_item_path
			fill_in "Title", with: "Poopers"
			fill_in "Description", with: ""
			fill_in "Price", with: "800"
			click_button "Create Item"
			expect(current_path).to eq(admin_items_path)
			expect(page).to have_content 'blank'
		end

		it	'cannot create an item without a price' do
			visit new_admin_item_path
			fill_in "Title", with: "Poopers"
			fill_in "Description", with: ""
			fill_in "Price", with: ""
			click_button "Create Item"
			expect(current_path).to eq(admin_items_path)
			expect(page).to have_content 'blank'
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

		it 'cannot update an item without a title' do
			item = Item.create(title: "OMG Donut", description: "Just like, wow.", price: 1800)
			visit edit_admin_item_path(item)
			fill_in "Title", with: ""
			fill_in "Description", with: "It's pretty fancy"
			fill_in "Price", with: "800"
			click_button "Update Item"
			expect(current_path).to eq(admin_item_path(item))
			expect(page).to have_content 'blank'
		end

		it 'cannot update an item without a description' do
			item = Item.create(title: "OMG Donut", description: "Just like, wow.", price: 1800)
			visit edit_admin_item_path(item)
			fill_in "Title", with: "Poopers"
			fill_in "Description", with: ""
			fill_in "Price", with: "800"
			click_button "Update Item"
			expect(current_path).to eq(admin_item_path(item))
			expect(page).to have_content 'blank'
		end

		it 'cannot update an item without a price' do
			item = Item.create(title: "OMG Donut", description: "Just like, wow.", price: 1800)
			visit edit_admin_item_path(item)
			fill_in "Title", with: "Poopers"
			fill_in "Description", with: "Tasty"
			fill_in "Price", with: ""
			click_button "Update Item"
			expect(current_path).to eq(admin_item_path(item))
			expect(page).to have_content 'blank'
		end

		it 'can delete and item' do
			item = Item.create(title: "Shitty Donut", description: "A Mistake", price: 0)
			visit admin_item_path(item)
			click_link "Delete"
			expect(current_path).to eq(admin_items_path)
			expect(page).not_to have_content "Shitty Donut"
			expect(page).not_to have_content "A Mistake"
		end

		it 'shows categories on edit item page' do
			category = Category.create(id: 1, name: 'Test Category')
			category = Category.create(id: 2, name: 'Testy Category')
			item = Item.create(title: "OMG Donut", description: "Just like, wow.", price: 1800, category_ids: ['1', '2'])
			visit edit_admin_item_path(item)
			expect(page).to have_content "Test Category"
			expect(page).to have_content "Testy Category"
		end

		it 'has can delete a category from item' do
			category = Category.create(id: 27, name: 'Test Category')
			item = Item.create(id: 17, title: "OMG Donut", description: "Just like, wow.", price: 1800)
			item_cateogry = ItemCategory.create(item_id: 17, category_id: 27)
			visit edit_admin_item_path(item)
			expect(page).to have_content "Test Category"
			click_link "Delete"
			expect(page).to_not have_content "Delete"
		end

		it 'can add a category to an item' do
			Category.create(id: 27, name: 'Test Category')
			Category.create(id: 28, name: 'Testy Cat')
			Category.create(id: 29, name: 'Tasty')
			visit edit_admin_item_path(item)
			expect(page).to_not have_content 'Delete'
			click_link "Tasty"
			expect(page).to have_content 'Delete'
		end

		it 'can retire an item from being sold' do
			expect(page).to have_link('Retire')
			click_link 'Retire'
			expect(page).not_to have_link('Retire')
		end

		it 'has a link to activate a retired item' do
			expect(page).not_to have_link('Activate')
			click_link 'Retire'
			expect(page).to have_link('Activate')
			expect(page).not_to have_link('Retire')
		end

		it 'can activate a retired item' do
			click_link 'Retire'
			click_link 'Activate'
			expect(page).to have_link('Retire')
			expect(page).not_to have_link('Activate')
		end
	end
end
