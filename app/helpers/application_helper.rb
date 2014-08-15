module ApplicationHelper
  def get_update_button(status)
    status == 'ordered' ? 'Mark as Paid' : 'Mark as Completed'
  end
end
