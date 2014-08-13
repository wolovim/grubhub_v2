require 'rails_helper'

describe User, type: :model do

  let(:pwner) do
    User.new(email: "yourmom123@aol.com",
             first_name: "John",
             last_name: "Michael",
             nickname: "pwner2000",
             password: "123456",
             password_confirmation: "123456",
             role: "admin"
              )
  end

  it 'is valid' do
    expect(pwner).to be_valid
  end

  it { should validate_presence_of(:email) }
end
