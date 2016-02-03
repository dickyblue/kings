class Gallery < ActiveRecord::Base
  
  # attr_accessible :image, :description, :featured, :lodging, :name, :engagement, :friend_upload, :user_id, :friend_uploader, :wedding, :wedding_cruise
  
  has_many :comments
  accepts_nested_attributes_for :comments
  
  mount_uploader :image, GalleryUploader
  
  # Gallery.all.each do |gal|
  #   gal.image.recreate_versions!(:thumb_2)
  #   gal.save
  # end

  # def self.images_for_type(img_type)
  #   if img_type == 'wedding'
  #    where(wedding: true).paginate(...)
  #   end
  # end
  
end
