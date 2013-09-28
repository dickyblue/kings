class Food < ActiveRecord::Base

  attr_accessible :title, :content, :publish_date, :author, :published, :food_images_attributes, :restaurant, :restaurant_location
  
  has_many :food_images
  has_many :comments
  has_many :recipes
  
  accepts_nested_attributes_for :food_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :comments, :recipes

end
