class User<ActiveRecord::Base
  attr_accessor :password, :password_confirmation

  validates :email, presence: true
  validates :password, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
end
