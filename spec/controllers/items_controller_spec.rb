require 'rails_helper'

RSpec.describe ItemsController, type: :controller do 
	let(:valid_attributes) { { title: 'A Donut', description: 'A Good One', price: 10000 } }
	describe 'GET index' do
		it 'exists' do
			get :index
			expect(response.code).to eq "200"
		end

		it 'assigns the items as @items' do
			item = Item.create!(valid_attributes)
			get :index
			expect(assigns(:items)).to eq [item]
		end
	end

end