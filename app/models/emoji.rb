class Emoji < ApplicationRecord
  validates :name, presence:true,length: { maximum: 15 }
  validates :image, presence:true
  mount_uploader :image, ImageUploader

  has_many :categories_emojis
  has_many :categories, through: :categories_emojis


  def new
    @emoji = Emoji.new
  end


end
