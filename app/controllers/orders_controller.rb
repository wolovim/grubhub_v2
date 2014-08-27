class OrdersController < ApplicationController
  def index
    @orders = Order.current_orders(current_user)
  end

  def show
    @order = Order.find(params[:id])
  end

  def new
    if current_user
      @order = Order.new
      @order.address = Address.new
      @items = Item.where(id: session[:cart].keys)
      @addresses = current_user.addresses
		else
			flash[:error] = "Please login or register to continue checkout"
			redirect_to login_path
		end
	end

  def create
    @order = current_user.orders.new_with_items(merged_params, current_cart)

    if @order.save
      flash[:success] = 'Your order has been received.'
      redirect_to order_path(@order)
    else
      @addresses = current_user.addresses
      @items = Item.where(id: session[:cart].keys)
      render :new
    end
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
      redirect_to orders_path
    else
      render :edit
    end
  end

  def cancel
    @order = Order.find(params[:order_id])
    @order.cancel
    redirect_to orders_path
  end

  def update_status
    @order = Order.find(params[:order_id])
    @order.update_status
    redirect_to orders_path
  end

  def remove_item
    @order = Order.find(params[:order_id])
    @order.remove_item(params[:item_id])
    redirect_to edit_order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(:order_type, :address_id, address_attributes: [:street, :unit, :city, :state, :zip])
  end

  def merged_params
    adjusted_params = order_params
    if adjusted_params['address_attributes'].any? { |_, v| !v.empty? }
      adjusted_params['address_attributes']['user_id'] = current_user.id
    end
    adjusted_params
  end
end
