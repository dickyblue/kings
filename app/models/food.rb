class Food < ActiveRecord::Base

  attr_accessible :title, :content, :publish_date, :user_id, :published, :food_images_attributes, :restaurant, :restaurant_location, :rest, :recipe,
  :recipes_attributes, :featured_blog
  
  has_many :food_images
  has_many :comments
  has_many :recipes
  belongs_to :user
  
  accepts_nested_attributes_for :food_images, :allow_destroy => true
  # accepts_nested_attributes_for :food_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :recipes, :allow_destroy => true

  scope :featured_blogs, where(:featured_blog => true).order('publish_date DESC').limit(6)

  def self.featured_food_image(t)
    t.food_images.where(:featured => true)
  end

end
