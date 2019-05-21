class DestroyCategoriesEmojis < ActiveRecord::Migration[5.2]
  def change
    drop_table :categories_emojis
  end
end
