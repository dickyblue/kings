class AddTravelToComments < ActiveRecord::Migration
  def change
    add_column  :comments, :travel_id,  :integer
  end
end
