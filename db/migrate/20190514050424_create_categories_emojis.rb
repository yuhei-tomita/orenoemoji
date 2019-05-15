class CreateCategoriesEmojis < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_emojis do |t|
      t.integer :category_id
      t.integer :emoji_id

      t.timestamps null:false
    end
  end
end
