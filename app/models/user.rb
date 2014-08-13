class User<ActiveRecord::Base
  validates :email, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  def password=(password)
  end

  def password_confirmation=(password)
  end

end
