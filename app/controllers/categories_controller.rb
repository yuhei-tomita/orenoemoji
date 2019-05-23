  class CategoriesController < ApplicationController


  def new
    @category = Category.new
  end

  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(permit_params)
    if @category.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def show
    @category = Category.find(params[:id])
    @emojis= Emoji.from_category(params[:category_id])
  end



  private
    def permit_params
      params.require(:category).permit(:name)
    end
  end
