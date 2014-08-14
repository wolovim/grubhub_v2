require 'rails_helper'

describe '' do

  context 'as a user' do

    it 'can add address with a street, unit, city, state, and zip' do
      add_address
      expect(current_path).to eq addresses_path
      expect(page).to have_content('123 Rainbow Rd')
      expect(page).to have_content('12345')
    end

    it 'cannot add address without a street' do
      add_address(street: nil)
      expect(page).to have_content "Street can't be blank"
    end

    it 'cannot add address without a city' do
      add_address(city: nil)
      expect(page).to have_content "City can't be blank"
    end

    it 'cannot add address without a state' do
      add_address(state: nil)
      expect(page).to have_content "State can't be blank"
    end

    it 'cannot add address without state length of two' do
      add_address(state: 'C')
      expect(page).to have_content "State is the wrong length (should be 2 characters)"
    end
  end
end
