require 'rails_helper'

RSpec.describe OrderItem, type: :model  do
  it { should validate_numericality_of(:unit_price) }
end
