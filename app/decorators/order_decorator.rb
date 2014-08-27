class OrderDecorator < ApplicationDecorator
  decorates_association :user
  decorates_association :address
  decorates_association :order_items

  delegate_all
  delegate :name, :email, to: :user, prefix: true

  def update_link
    h.link_to text_for_update, h.admin_order_update_status_path(order),
      data: { confirm: 'Are you sure?' },
      class: 'btn btn-mini btn-success'
  end

  private

  def text_for_update
    ordered? ? 'Mark as Paid' : 'Mark as Completed'
  end
end
