class Gallery < ActiveRecord::Base

  attr_accessible :image, :description
  
  mount_uploader :image, GalleryUploader

end
