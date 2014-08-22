class CartsController < ApplicationController
  def show
    @items = Item.where(id: session[:cart].keys)
  end

  def update
    if item = Item.find_by(id: params[:item_id], enabled: true)
      flash[:success] = 'Added to your cart. (You can afford that?)'
      current_cart.store(params[:item_id], 1)
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
