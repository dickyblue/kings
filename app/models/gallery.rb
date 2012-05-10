class Gallery < ActiveRecord::Base

  attr_accessible :image, :description, :featured, :lodging, :name
  
  mount_uploader :image, GalleryUploader

end
