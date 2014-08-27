class ItemDecorator < Draper::Decorator
  delegate_all

  def display_categories
    categories.map { |c| c.name }.join(', ')
  end

  def price_in_dollars
    '$' + sprintf("%.2f", price / 100.00)
  end
end
