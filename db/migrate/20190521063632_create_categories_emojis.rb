class CreateCategoriesEmojis < ActiveRecord::Migration[5.2]
  def change
    create_table :categories_emojis do |t|
      t.references :category, foreign_key: true
      t.references :emoji, foreign_key: true

      t.timestamps
    end
  end
end
