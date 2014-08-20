class CartsController < ApplicationController
  def update
    if (item = Item.find_by(id: params[:item_id])) && item.enabled?
      current_cart << params[:item_id]
    else
      flash[:error] = 'That item is no longer available.'
    end
    redirect_to categories_path
  end
end
