require 'rails_helper'

describe 'loggin in' do

  context 'as a guest' do

    before(:each) { User.create email: 'yourmom123@aol.com',
                                password: '123',
                                password_confirmation: '123',
                                first_name: 'Jon',
                                last_name:  'Michael' }
    it 'successfully' do
      visit login_path
      fill_in 'Email', with: 'yourmom123@aol.com'
      fill_in 'Password', with: '123'
      click_button 'Login'
      expect(page).to_not have_content 'Login'
      expect(page).to     have_content 'Logout'
    end

  end
end
