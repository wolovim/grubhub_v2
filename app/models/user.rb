class User<ActiveRecord::Base
  attr_accessor :password

  validates :email,                 presence: true
  validates :password,              presence: true
  validates :password_confirmation, presence: true

  validates :password,              confirmation: true

  validates :email,                 uniqueness: true

  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
