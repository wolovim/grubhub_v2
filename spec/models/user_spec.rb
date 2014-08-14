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

  it { should validate_presence_of(:password) }

  it { should validate_presence_of(:password_confirmation) }
  
  it { should allow_value('me@example.com', 'yourmom123@aol.com').for :email }

  it { should_not allow_value('sdaf*!@~=-0>!', nil, '').for :email }

  it { should validate_confirmation_of(:password) }

  it { should validate_uniqueness_of(:email) }

end
