require 'rails_helper'

describe 'Redirect after login', type: :feature do
  context 'After accessing a protected page' do
    it 'returns to the referring page' do
      register_as_admin
      click_link 'Logout'

      visit admin_orders_path
      fill_in 'Email', with: 'yourdad123@aol.com'
      fill_in 'Password', with: '123'
      click_button 'Login'
      expect(current_path).to eq admin_orders_path
    end
  end

  context 'From an unprotected page' do
    it 'redirects to order dashboard' do
      register_as_admin
      login_as_admin
      
      expect(current_path).to eq admin_orders_path
    end
  end
end
