class PhotoCategory < ActiveRecord::Base

  has_many :gallery_categorizations
  has_many  :galleries, :through => :gallery_categorizations
  
end
