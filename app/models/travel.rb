class Travel < ActiveRecord::Base
  
  attr_accessible :title, :content, :publish_date, :user_id, :published, :travel_images_attributes, :destination
  
  belongs_to :user
  has_many :travel_images
  has_many :comments
  
  accepts_nested_attributes_for :travel_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :comments
  
  
end
