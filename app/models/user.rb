class User<ActiveRecord::Base
  validates :email, presence: true

  def password=(password)
  end

  def password_confirmation=(password)
  end

end
