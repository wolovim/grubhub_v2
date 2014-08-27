class OrderDecorator < Draper::Decorator
  decorates_association :user
  decorates_association :address
  decorates_association :order_items

  delegate_all
  delegate :name, :email, to: :user, prefix: true
end
