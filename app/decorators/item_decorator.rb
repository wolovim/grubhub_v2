class ItemDecorator < Draper::Decorator
  delegate_all

  def display_categories
    categories.map { |c| c.name }.join(', ')
  end

  def unit_price_dollars
    h.price_in_dollars(price)
  end

	def unit_price_decimal
    h.price_in_decimal(object.price)
	end
end
