require 'rails_helper'

RSpec.describe Address, :type => :model do

  it { should validate_presence_of(:street) }

  it { should validate_presence_of(:city) }

  it { should validate_presence_of(:state) }

  it { should ensure_length_of(:state).is_equal_to 2 }

  it { should validate_presence_of(:zip) }

  it { should ensure_length_of(:state).is_equal_to 2 }

  it { should ensure_length_of(:zip).is_equal_to 5 }
  
end
