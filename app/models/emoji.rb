class Emoji < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :categories_emojis
  has_many :categories, through: :categories_emojis


  def new
    @emoji = Emoji.new
  end


end
