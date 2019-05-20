class CategoriesController < ApplicationController
end

def show
  @category = Category.find(params[:categories_id])
end
