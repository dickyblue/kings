class Gallery < ActiveRecord::Base
  
  attr_accessible :image, :description, :featured, :lodging, :name, :engagement, :friend_upload, :user_id, :friend_uploader, :wedding, :wedding_cruise
  
  has_many :comments
  accepts_nested_attributes_for :comments
  
  mount_uploader :image, GalleryUploader
  
  
end
