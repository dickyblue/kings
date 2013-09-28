class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references  :food
      t.string      :name
      t.text        :recipe_instructions
      t.timestamps
    end
  end
end
