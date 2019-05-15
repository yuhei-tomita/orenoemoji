class CategoriesEmoji < ApplicationRecord
  belongs_to :categories
  belongs_to :emojis
end
