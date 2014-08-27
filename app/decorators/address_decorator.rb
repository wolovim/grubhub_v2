class AddressDecorator < Draper::Decorator
  delegate_all

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
