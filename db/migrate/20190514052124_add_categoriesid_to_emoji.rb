class AddCategoriesidToEmoji < ActiveRecord::Migration[5.2]
  def change
    add_column :emojis, :categories_id, :integer
  end
end
