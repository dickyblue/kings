class TravelImage < ActiveRecord::Base

  attr_accessible :image, :name, :description, :featured
    
  belongs_to :travel, :foreign_key => 'travel_id'

  mount_uploader :image, TravelImageUploader

  
  
end
