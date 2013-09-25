class TravelImage < ActiveRecord::Base

  attr_accessible :image, :remote_image_url

  mount_uploader :image, TravelUploader
  
  belongs_to :travel, :foreign_key => 'travel_id'

end
