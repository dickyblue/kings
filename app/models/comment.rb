class Comment < ActiveRecord::Base

  belongs_to :user, :foreign_key => "user_id"
  belongs_to :gallery, :foreign_key => "gallery_id"
  
  attr_accessible :content, :user_id, :commenter, :gallery_id
  validates :content, :presence => true

end
