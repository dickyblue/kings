class Gallery < ActiveRecord::Base

  attr_accessible :image, :description, :featured, :lodging
  
  mount_uploader :image, GalleryUploader

end
