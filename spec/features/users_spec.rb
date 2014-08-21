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

    it 'cannot register with an email already registersed' do
      register
      click_on 'Logout'
      register
      expect(page).to have_content "Email has already been taken"
    end

    it 'cannot register with an invalid email address' do
      register(email: '^$%^%#$@#$^%$^.com')
      expect(page).to have_content "Email is invalid"
    end

    it 'cannot register without a password' do
      register(password: nil)
      expect(page).to have_content "Password can't be blank"
    end

    it 'cannot register without a password confirmation' do
      register(password_confirmation: nil)
      expect(page).to have_content "Password confirmation can't be blank"
    end

    it 'cannnot register when passwords do not match' do
      register(password: '123', password_confirmation: '1234')
      expect(page).to have_content "Password confirmation doesn't match Password"
    end

    it 'stays logged in after registration' do
      register
      expect(page).to have_link "Logout"
    end

    it 'gives me confirmation after successful registration' do
      register
      expect(page).to have_content "Registration successful, congrats you can use a keyboard."
    end

    it 'cannot backdoor to admin pages' do
      visit admin_items_path
      expect(current_path).to eq(login_path)
      visit admin_categories_path
      expect(current_path).to eq(login_path)

    it 'can view their orders' do
      register
      click_on "Account"
      click_on "My Orders"
      expect(page).to have_content "My Orders"
    end

    it 'can view their user profile' do
      register
      click_on "Account"
      click_on "Profile"
      expect(page).to have_content "Account Settings"
    end
  end
end
