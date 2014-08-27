class CategoryDecorator < Draper::Decorator
  delegate_all

  decorates_association :items
end
