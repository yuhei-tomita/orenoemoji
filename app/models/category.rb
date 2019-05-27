class Category < ApplicationRecord

  has_many :categories_emojis, dependent: :destroy
  has_many :emojis, through: :categories_emojis


  def new
    @category = Category.new
  end

end
