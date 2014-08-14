require 'rails_helper'

describe 'Visiting the homepage' do
	it "shouldn't fail" do
		visit root_path
		expect(page.status_code).to eq 200
	end
end
