class Category < ApplicationRecord
  has_many :categories_emojis, dependent: :destroy
  has_many :emojis, through: :categories_emojis

scope :from_category, -> (category_id){ where(id: emoji_ids = CategoriesEmoji.where(category_id: category_id).select(:emoji_id))}

scope :from_emoji, -> (emoji_id){ where(id: category_ids = CategoriesEmoji.where(emoji_id: emoji_id).select(:category_id))}

  def new
    @category = Category.new
  end




end
