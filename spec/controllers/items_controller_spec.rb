require 'rails_helper'

RSpec.describe ItemsController, type: :controller do 
	let(:valid_attributes) { { title: 'A Donut', description: 'A Good One', price: 10000 } }
	let(:item) { Item.create!(valid_attributes) }

	describe 'GET index' do
		it 'exists' do
			get :index
			expect(response.code).to eq "200"
		end

		it 'assigns the items as @items' do
			get :index
			expect(assigns(:items)).to eq [item]
		end
	end

	describe 'GET show' do 
		it 'assigns the item as item' do
			get :show, {id: item.to_param}
			expect(assigns(:item)).to eq(item)
		end
	end

	describe 'GET new' do
		it 'assign a new item to item' do
			get :new
			expect(assigns(:item)).to be_a_new(Item)
		end
	end

	describe 'GET edit' do
		it "assigns the requested item as @item" do
			get :edit, {:id => item.to_param}
			expect(assigns(:item)).to eq(item)
		end
	end

	describe 'POST create' do
		it 'creates a new item' do
			expect {
				post :create, {item: valid_attributes}
			}.to change(Item, :count).by(1)
		end
	end

	describe 'PUT update' do
		let(:new_donut) { {title: "Newish Donut", description: "nommy", price: 100} }
		it "updates an item" do
			put :update, {id: item.to_param, item: new_donut}
			item.reload
			expect(item.title).to eq "Newish Donut"
		end
	end

end