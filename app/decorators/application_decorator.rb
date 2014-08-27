class ApplicationDecorator < Draper::Decorator
  def updated_date
    object.updated_at.to_time.strftime("%m/%d/%Y")
  end

  def created_date
    object.created_at.to_time.strftime("%m/%d/%Y")
  end

  def created_time
    object.created_at.to_time.strftime("%I:%M %p")
  end

  def updated_time
    object.updated_at.to_time.strftime("%I:%M %p")
  end
end
