class AddFoodToComments < ActiveRecord::Migration
  def change
    add_column  :comments, :food_id,  :integer
  end
end
