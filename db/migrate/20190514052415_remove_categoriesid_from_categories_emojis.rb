class RemoveCategoriesidFromCategoriesEmojis < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories_emojis, :category_id, :integer
  end
end
