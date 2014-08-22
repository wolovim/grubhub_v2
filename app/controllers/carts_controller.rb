class CartsController < ApplicationController
  def show
    @items = Item.where(id: session[:cart].keys)
  end

  def update
    item_id = params[:item_id]
    if item = Item.find_by(id: item_id, enabled: true)
      current_quantity = current_cart[item_id] || 0
      current_cart.store(item_id, current_quantity + 1)
      flash[:success] = 'Added to your cart. (You can afford that?)'
    else
      flash[:error] = 'That item is no longer available.'
    end

    redirect_to categories_path
  end

  def destroy
    item = Item.find_by(id: params[:cart][:item_id])
    current_cart.delete(params[:cart][:item_id])
    flash[:success] = "'#{item.title}' has been removed from your cart."
    redirect_to cart_path
  end
end
