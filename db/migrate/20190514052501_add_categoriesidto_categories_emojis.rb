class AddCategoriesidtoCategoriesEmojis < ActiveRecord::Migration[5.2]
  def change
    add_column :categories_emojis, :categories_id, :integer
  end
end
