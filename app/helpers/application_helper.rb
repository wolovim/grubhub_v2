module ApplicationHelper
  def get_update_button(status)
    status == 'ordered' ? 'Mark as Paid' : 'Mark as Completed'
  end

  def pending?(status)
    status == 'ordered' || status == 'paid'
  end

  def orders_by_status(status)
    count = 0
    Order.all.each { |order| count += 1 if order.status == status }
    count
  end

  def get_categories
    Category.all.map { |category| category.name }
  end

  def categories
    Category.all
  end
end
