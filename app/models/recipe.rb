class Recipe < ActiveRecord::Base

  attr_accessible :name, :recipe_instructions, :ingredients_attributes
  
  has_many :ingredients
  belongs_to :food
  
  accepts_nested_attributes_for :ingredients

end
