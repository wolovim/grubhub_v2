require 'rails_helper'

describe 'Authorization', type: :feature do
  context 'As a guest' do
    it 'cannot view a page requiring authorization' do
      visit admin_orders_path

      expect(current_path).to eq login_path
      expect(page).to have_content 'You must be logged in to access that.'
    end
  end

  context 'As an admin' do
    it 'can view a page requiring authorization' do
      register_as_admin
      login_as_admin

      visit admin_orders_path
      expect(current_path).to eq admin_orders_path
    end
  end
end
