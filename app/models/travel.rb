class Travel < ActiveRecord::Base
  
  attr_accessible :title, :content, :publish_date, :user_id, :published, :travel_images_attributes, :destination, :featured_blog
  
  belongs_to :user
  has_many :travel_images
  has_many :comments
  
  accepts_nested_attributes_for :travel_images, :reject_if => lambda { |g| g[:image].blank? }, :allow_destroy => true
  accepts_nested_attributes_for :comments
  
  scope :featured_blogs, where(:featured_blog => true).order('publish_date DESC').limit(6)
  
  def self.featured_travel_image(t)
    t.travel_images.where(:featured => true)
  end
  
  
    
end
