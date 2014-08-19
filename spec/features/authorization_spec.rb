require 'rails_helper'

#class UsersController < ApplicationController
#  before_action :check_admin
#end

describe 'Authorization', type: :feature do
  context 'As a guest' do
    it 'cannot view a page requiring authorization' do
      skip
      visit new_user_path
      expect(current_path).to eq login_path
      expect(page).to have_content 'You must be logged in to access that.'
    end
  end

  context 'As an admin' do
    it 'can view a page requiring authorization' do
      skip
      register
      login
      visit new_user_path
    end
  end
end
