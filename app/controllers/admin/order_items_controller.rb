class Admin::OrderItemsController < ApplicationController
  def destroy
    @order_item = OrderItem.find(params[:id])
    order = Order.find(@order_item.order_id)
    @order_item.destroy
    redirect_to edit_admin_order_path(order)
  end

  def update
    @order_item = OrderItem.find(params[:id])
    order = Order.find(@order_item.order_id)
    @order_item.update(order_item_params)
    redirect_to edit_admin_order_path(order)
  end

  private

  def order_item_params
    params.require(:order_item).permit(:order_id, :item_id, :quantity, :unit_price)
  end
end
