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

	it 'can create a new item' do
		visit new_item_path
		fill_in "Title", with: "Fancy New Donut"
		fill_in "Description", with: "It's pretty fancy"
		fill_in "Price", with: "800"
		click_button "Create Item"
		expect(current_path).to eq(items_path)
		expect(page).to have_content 'Fancy New Donut'
		expect(page).to have_content "It's pretty fancy"
	end

	it 'can update an item' do
		item = Item.create(title: "OMG Donut", description: "Just like, wow.", price: 1800)
		visit edit_item_path(item)
		fill_in "Title", with: "Fancy New Donut"
		fill_in "Description", with: "It's pretty fancy"
		fill_in "Price", with: "800"
		click_button "Update Item"
		expect(current_path).to eq(items_path)
		expect(page).to have_content 'Fancy New Donut'
		expect(page).to have_content "It's pretty fancy"
		expect(page).not_to have_content 'OMG Donut'
		expect(page).not_to have_content "Just like, wow."
	end

	it 'can delete and item' do
		item = Item.create(title: "Shitty Donut", description: "A Mistake", price: 0)
		visit item_path(item)
		click_link "Delete Deliciousness"
		expect(current_path).to eq(items_path)
		expect(page).not_to have_content "Shitty Donut"
		expect(page).not_to have_content "A Mistake"
	end

	it 'shows the category associated with an item' do
		item = Item.create(title: "Shitty Donut", description: "A Mistake", price: 0)
		category = Category.create(name: "Savory")
		item.categories << category
		category.items << item
		visit item_path(item)
		expect(page).to have_content "Shitty Donut"
		expect(page).to have_content "Savory"
		visit items_path
		expect(page).to have_content "Shitty Donut"
		expect(page).to have_content "Savory"
	end

end