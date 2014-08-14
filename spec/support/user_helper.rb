def register(email: 'test@example.com',
            password: '123456',
            password_confirmation: '123456')

  visit root_path
  click_on('Register')
  fill_in "Email", with: email
  fill_in "Password" , with: password
  fill_in "Password confirmation", with: password_confirmation
  click_on "Create User"
end
