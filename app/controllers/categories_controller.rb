  class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def index
    @categories = Category.all.shuffle
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
    @emojis= @category.emojis
  end

  def search
    @categories = Category.where('name LIKE(?)', "%#{params[:keyword]}%")
    render json: @categories.as_json
  end

  private
    def permit_params
      params.require(:category).permit(:name,)
    end
  end
