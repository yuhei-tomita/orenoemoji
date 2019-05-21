class Category < ApplicationRecord
  has_many :emojis, through: :categories_emojis
  has_many :categories_emojis
  accepts_nested_attributes_for :categories_emojis

  def new
    @category = Category.new
  end




end
