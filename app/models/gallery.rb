class Gallery < ActiveRecord::Base

  attr_accessible :image, :description, :featured
  
  mount_uploader :image, GalleryUploader

end
