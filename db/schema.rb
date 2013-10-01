# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131001024232) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "commenter"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "gallery_id"
    t.integer  "travel_id"
    t.integer  "food_id"
  end

  add_index "comments", ["gallery_id"], :name => "index_comments_on_gallery_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "food_images", :force => true do |t|
    t.integer  "food_id"
    t.string   "image"
    t.string   "name"
    t.text     "description"
    t.boolean  "featured"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "foods", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "publish_date"
    t.boolean  "published",           :default => false
    t.string   "restaurant"
    t.string   "restaurant_location"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.boolean  "rest"
    t.boolean  "recipe"
    t.integer  "user_id"
  end

  create_table "galleries", :force => true do |t|
    t.string   "image"
    t.string   "name"
    t.text     "description"
    t.boolean  "featured"
    t.boolean  "lodging"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.boolean  "engagement"
    t.integer  "user_id"
    t.boolean  "friend_upload"
    t.string   "friend_uploader"
    t.boolean  "wedding_cruise"
    t.boolean  "wedding"
  end

  create_table "ingredients", :force => true do |t|
    t.string   "ingredient_name"
    t.string   "quantity_used"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "recipe_id"
  end

  add_index "ingredients", ["recipe_id"], :name => "index_ingredients_on_recipe_id"

  create_table "quotes", :force => true do |t|
    t.text     "quote"
    t.string   "author"
    t.boolean  "travel"
    t.boolean  "food"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "recipes", :force => true do |t|
    t.integer  "food_id"
    t.string   "name"
    t.text     "recipe_instructions"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "travel_comments", :force => true do |t|
    t.integer  "travel_id"
    t.text     "content"
    t.string   "commenter"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "travel_images", :force => true do |t|
    t.integer  "travel_id"
    t.string   "image"
    t.string   "name"
    t.text     "description"
    t.boolean  "featured"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "travels", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "publish_date"
    t.boolean  "published",    :default => false
    t.string   "destination"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.integer  "user_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name",                   :limit => 25
    t.string   "email",                  :limit => 75
    t.string   "password_salt"
    t.string   "password_hash"
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.boolean  "admin",                                :default => false
    t.datetime "created_at",                                              :null => false
    t.datetime "updated_at",                                              :null => false
    t.datetime "lastlogin"
    t.boolean  "attending",                            :default => false
    t.string   "image"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
