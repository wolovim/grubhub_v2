def register(first_name: 'Gen',
             last_name: 'Casagrande',
             email: 'yourmom123@aol.com',
             password: '123',
             password_confirmation: '123',
             nickname: 'gen')

  visit root_path
  click_on('Register')

  fill_in "First name",            with: first_name
  fill_in "Last name",             with: last_name
  fill_in "Email",                 with: email
  fill_in "Password" ,             with: password
  fill_in "Password confirmation", with: password_confirmation
  fill_in 'Nickname',              with: nickname
  click_on "Create User"
end

def register_as_admin(first_name: 'Gen',
                      last_name: 'Casagrande',
                      email: 'yourdad123@aol.com',
                      password: '123',
                      password_confirmation: '123')

  register(first_name: first_name, last_name: last_name, email: email, password: password, password_confirmation: password_confirmation)
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
