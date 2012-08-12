class Gallery < ActiveRecord::Base

  attr_accessible :image, :description, :featured, :lodging, :name, :engagement
  
  mount_uploader :image, GalleryUploader

end
