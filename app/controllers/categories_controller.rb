class CategoriesController < ApplicationController
	def index
    @categories = Category.with_items.decorate
	end
end
