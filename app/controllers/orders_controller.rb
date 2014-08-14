class OrdersController < ApplicationController
	def index
		@orders = Order.all
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to orders_path
		else
			render :edit
		end
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :order_type, :address_id, :status, :total)
	end
end