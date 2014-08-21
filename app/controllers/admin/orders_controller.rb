class Admin::OrdersController < AdminController
  before_action :check_admin, only: [:index]

	def index
		@orders = Order.all
	end

	def show
		@order = Order.find(params[:id])
	end

	def ordered
	  @orders = Order.all_ordered
		render :index
	end

	def paid
		@orders = Order.all_paid
		render :index
	end

	def completed
		@orders = Order.all_completed
		render :index
	end

	def cancelled
		@orders = Order.all_cancelled
		render :index
	end

	def edit
		@order = Order.find(params[:id])
	end

	def update
		@order = Order.find(params[:id])
		if @order.update(order_params)
			redirect_to admin_orders_path
		else
			render :edit
		end
	end

	def cancel
		@order = Order.find(params[:order_id])
		@order.cancel
		redirect_to admin_orders_path
	end

	def update_status
		@order = Order.find(params[:order_id])
		@order.update_status
		redirect_to admin_orders_path
	end

	def remove_item
		@order = Order.find(params[:order_id])
		@order.remove_item(params[:item_id])
		redirect_to edit_admin_order_path(@order)
	end

	private

	def order_params
		params.require(:order).permit(:user_id, :order_type, :address_id, :status, :total)
	end
end
