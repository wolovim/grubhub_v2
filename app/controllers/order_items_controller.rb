class OrderItemsController < ApplicationController
  def destroy
    order_item = OrderItem.find(params[:id])
    order = Order.find(order_item.order_id)
    order_item.destroy
    redirect_to edit_order_path(order)
  end
end
