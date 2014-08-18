class Address < ActiveRecord::Base
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :state,  length: { is: 2 }
  validates :zip,    presence: true
  validates :zip,    length: { is: 5 }  
end
