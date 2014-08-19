class CartsController < ApplicationController
  def update
    current_cart << params[:item_id]
    redirect_to categories_path
  end
end
