class Travel < ActiveRecord::Base
  
  attr_accessible :title, :content, :publish_date, :author, :published, :travel_images_attributes
  
  has_many :travel_images
  
  accepts_nested_attributes_for :travel_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true

end
