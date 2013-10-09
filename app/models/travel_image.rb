class TravelImage < ActiveRecord::Base

  attr_accessible :image, :name, :description, :featured, :image_cache
    
  belongs_to :travel, :foreign_key => 'travel_id'

  mount_uploader :image, TravelImageUploader

  
  
end
