class Address < ActiveRecord::Base
  validates :street, presence: true
  validates :city,   presence: true
  validates :state,  presence: true
  validates :state,  length: { is: 2 }
  validates :zip,    presence: true
  validates :zip,    length: { is: 5 }

  belongs_to :user
  has_many :orders

  def to_s
    str = ""
    str << street
    str << " #{unit}" if !unit.empty?
    str << ", #{city}"
    str << ", #{state}"
    str << " #{zip}"
    str
  end
end
