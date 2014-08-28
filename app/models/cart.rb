class Cart < ActiveRecord::Base
  include CartMethods

  belongs_to :user
  before_save :store_items

  def cart
    @cart ||= JSON.parse(items)
  end

  def store_items
    self.items = cart.to_json
  end

  def clear
    cart.clear
    save
  end
end
