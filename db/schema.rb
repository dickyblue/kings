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

ActiveRecord::Schema.define(:version => 20121010213325) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "content"
    t.string   "commenter"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "gallery_id"
  end

  add_index "comments", ["gallery_id"], :name => "index_comments_on_gallery_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

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
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

end
