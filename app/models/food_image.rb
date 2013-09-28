class FoodImage < ActiveRecord::Base

  attr_accessible :image, :name, :description, :featured
    
  belongs_to :food, :foreign_key => 'food_id'

  mount_uploader :image, FoodImageUploader

end
