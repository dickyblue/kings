class Comment < ActiveRecord::Base

  belongs_to :user, :foreign_key => "user_id"
  
  attr_accessible :content, :user_id, :commenter
  validates :content, :presence => true

end
