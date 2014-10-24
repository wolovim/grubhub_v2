class CartsController < ApplicationController
  def show
    @items = Item.where(id: current_cart.keys).decorate
  end

  def update
    item_id = params[:cart][:item_id]
    quantity = params[:cart][:quantity].to_i

    if item = Item.find_by(id: item_id, enabled: true)
      current_cart.store(item_id, quantity)
      current_cart.save

      if current_cart.quantity(item_id) > 0
        if current_cart.new?(item_id)
          flash[:success] = 'Added to your cart. (You can afford that?)'
        else
          flash[:success] = 'Updated quantity for item.'
        end
      else
        flash[:success] = "'#{item.title}' has been removed from your cart."
        redirect_to cart_path
        return
      end
    else
      flash[:error] = 'That item is no longer available.'
    end

    redirect_to :back
  end

  def destroy
    item = Item.find_by(id: params[:cart][:item_id])
    current_cart.delete(item.id)
    current_cart.save

    flash[:success] = "'#{item.title}' has been removed from your cart."
    redirect_to cart_path
  end
end
