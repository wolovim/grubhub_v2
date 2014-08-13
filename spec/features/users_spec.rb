require 'rails_helper'

describe '' do
  context 'an unauthenticated user' do
    it 'can see a register link' do
      visit root_path
      expect(page).to have_link 'Register'
    end

    it 'can register a new account' do
      register
      expect(current_path).to eq root_path
      expect(User.count).to eq 1
    end

    it 'cannot register without an email' do
      register(email: nil)
      expect(page).to have_content "Email can't be blank"
    end

    it 'cannot register with an invalid email address' do
      register(email: '^$%^%#$@#$^%$^.com')
      expect(page).to have_content "Email is invalid"
    end

  

  end
end
