class Admin::ItemsController < AdminController
	def index
    @items = Item.includes(:categories).all.decorate
	end

	def show
    @item = Item.find(params[:id]).decorate
	end

	def new
		@item = Item.new
	end

	def create
		@item = Item.new(item_params)
		if @item.save
			redirect_to admin_items_path
		else
			render :new
		end
	end

	def edit
    @item = Item.find(params[:id]).decorate
    @categories = Category.all
	end

	def update
    @item = Item.find(params[:id]).decorate
		if @item.update(item_params)
			redirect_to admin_items_path
		else
			render :edit
		end
	end

	def delete_category
		item = Item.find(params[:item_id])
		item.remove_category(params[:category_id])
		redirect_to edit_admin_item_path(item)
	end

	def add_category
		item = Item.find(params[:item_id])
		unless ItemCategory.find_by(item_id: params[:item_id], category_id: params[:category_id])
			ItemCategory.create(item_id: params[:item_id], category_id: params[:category_id])
		end
		redirect_to edit_admin_item_path(item)
	end

	def destroy
		Item.find(params[:id]).destroy
		redirect_to admin_items_path
	end

	def retire
		@item = Item.find(params[:item_id])
		@item.retire
		redirect_to admin_items_path
	end

	private

	def item_params
		safe_params = params.require(:item).permit(:title, :description, :price, :image)
    update_params(safe_params)
	end

	def update_params(columns)
    columns[:price] = (columns[:price].to_d * 100).to_i unless columns[:price].empty?
		columns
	end
end
