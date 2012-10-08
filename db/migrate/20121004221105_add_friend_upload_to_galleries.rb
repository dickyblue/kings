class AddFriendUploadToGalleries < ActiveRecord::Migration
  def change
    add_column  :galleries, :user_id,         :integer
    add_column  :galleries, :friend_upload,   :boolean
    add_column  :galleries, :friend_uploader, :string
  end
end
