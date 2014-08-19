require 'rails_helper'

describe 'When viewing the admin dashboard' do

	it 'has a dashboard with orders' do
		visit admin_path

		expect(page).to have_content("Orders")
	end

end
