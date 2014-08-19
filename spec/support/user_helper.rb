def register(email: 'yourmom123@aol.com',
             password: '123',
             password_confirmation: '123')

  visit root_path
  click_on('Register')
  fill_in "Email", with: email
  fill_in "Password" , with: password
  fill_in "Password confirmation", with: password_confirmation
  click_on "Create User"
end

def register_as_admin(email: 'yourdad123@aol.com',
                      password: '123',
                      password_confirmation: '123')

  register(email: email, password: password, password_confirmation: password_confirmation)
  User.last.update_column(:role, 'admin')
end

def login(email: 'yourmom123@aol.com', password: '123')
  visit login_path

  fill_in 'Email', with: email
  fill_in 'Password', with: password
  click_button 'Login'
end

def login_as_admin(email: 'yourdad123@aol.com', password: '123')
  login(email: email, password: password)
end
