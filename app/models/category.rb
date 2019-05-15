class Category < ApplicationRecord
  has_many :categories_emojis
  has_many :emojis, through: :categories_emojis

  def new
    @category = Category.new
  end

  def show
  end


end
