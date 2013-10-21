class Comment < ActiveRecord::Base

  belongs_to  :user, :foreign_key => "user_id"
  belongs_to  :gallery, :foreign_key => "gallery_id"
  belongs_to   :travel, :foreign_key => "travel_id"
  
  attr_accessible :content, :user_id, :commenter, :gallery_id, :travel_id, :food_id
  validates :content, :presence => true

end
