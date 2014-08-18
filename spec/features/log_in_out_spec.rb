require 'rails_helper'

describe 'Logging in' do

  before(:each) { User.create email: 'yourmom123@aol.com',
                  password: '123',
                  password_confirmation: '123',
                  first_name: 'Jon',
                  last_name:  'Michael' }

  context 'as a Guest' do
    it 'logs in successfully' do
      login
      expect(page).to_not have_content 'Login'
      expect(page).to     have_content 'Logout'
    end
  end

  context 'as an Authenticated User' do
    it 'logs out' do
      login
      click_on 'Logout'
      expect(page).to     have_content 'Login'
      expect(page).to_not have_content 'Logout'
    end
  end
end
