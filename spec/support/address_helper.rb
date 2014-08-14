def add_address(street: '123 Rainbow Rd',
                unit: '12',
                city: 'Mario Town',
                state: 'CO',
                zip: '12345')

  visit new_address_path
  fill_in 'Street', with: street
  fill_in 'Unit',   with: unit
  fill_in 'City',   with: city
  fill_in 'State',  with: state
  fill_in 'Zip',    with: zip
  click_on 'Add Address'
end
