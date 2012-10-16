class AddReferenceToComments < ActiveRecord::Migration
  def change
    add_column  :comments, :gallery_id,         :integer
  end
end
