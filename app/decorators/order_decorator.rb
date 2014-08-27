class OrderDecorator < Draper::Decorator
  decorates_association :user
  decorates_association :address

  delegate_all
  delegate :name, :email, to: :user, prefix: true
end
