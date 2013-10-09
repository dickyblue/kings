class AddFeaturedBlogToFoodAndTravels < ActiveRecord::Migration
  def change
    add_column :travels, :featured_blog, :boolean
    add_column :foods, :featured_blog, :boolean
  end
end
