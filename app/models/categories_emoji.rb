class CategoriesEmoji < ApplicationRecord
  belongs_to :category
  belongs_to :emoji
  validates :category_id, presence:true
  validates :emoji_id, presence:true
end
