require 'rails_helper'

describe 'When viewing the admin dashboard' do
	context "as an admin" do

		it "has a dashboard with orders" do
			visit '/admin/'

			expect(page).to have_content("Orders")
		end
	end

end