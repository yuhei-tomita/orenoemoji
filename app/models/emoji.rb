class Emoji < ApplicationRecord

  validates :name, presence:true,length: { maximum: 15 }
  validates :image, presence:true
  mount_uploader :image, ImageUploader

  has_many :categories_emojis, dependent: :destroy
  has_many :categories, through: :categories_emojis


  def new
    @emoji = Emoji.new
  end

  def save_categories(tags)
    current_tags = self.categories.pluck(:name) unless self.categories.nil?
    old_tags = current_tags - tags
    new_tags = tags - current_tags

    #Destroy old taggings:
    old_tags.each do |old_name|
      self.categories.delete Category.find_by(name:old_name)
    end

    #Create new taggings:
    new_tags.each do |new_name|
      categories_emoji = Category.find_or_create_by(name:new_name)
      self.categories << categories_emoji
    end
  end
end
