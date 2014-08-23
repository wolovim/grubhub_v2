class User<ActiveRecord::Base

  has_secure_password

  validates :first_name,            presence: true
  validates :last_name,             presence: true
  validates :email,                 presence: true
  validates :password_confirmation, presence: true
  validates :email,                 uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  validates_length_of :nickname, :minimum => 2, :maximum => 32, :allow_blank => true

  has_many :user_addresses
  has_many :addresses, through: :user_addresses


	def format_date
		self.created_at.to_time.strftime("%m/%d/%Y")
	end

end
