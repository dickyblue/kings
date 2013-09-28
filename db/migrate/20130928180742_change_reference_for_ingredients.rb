class ChangeReferenceForIngredients < ActiveRecord::Migration
  def up
    add_column :ingredients, :recipe_id, :integer
    add_index   :ingredients, :recipe_id
    remove_column :ingredients, :food_id
  end

  def down
    add_column :ingredients, :food_id, :integer
    add_index  :ingredients, :food_id
    remove_column :ingredients, :recipe_id
  end
end
