class Gallery < ActiveRecord::Base
  
  attr_accessible :image, :description, :featured, :lodging, :name, :engagement, :friend_upload, :user_id, :friend_uploader

  mount_uploader :image, GalleryUploader
    
  
end
