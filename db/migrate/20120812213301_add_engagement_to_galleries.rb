class AddEngagementToGalleries < ActiveRecord::Migration
  def change
    add_column  :galleries, :engagement, :boolean
  end
end
