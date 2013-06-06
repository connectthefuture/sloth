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

ActiveRecord::Schema.define(:version => 20130606132458) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "page_version_id"
    t.text     "body"
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "comments", ["created_at"], :name => "index_comments_on_created_at"
  add_index "comments", ["page_version_id"], :name => "index_comments_on_page_version_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "hearts", :force => true do |t|
    t.integer  "heartable_id"
    t.string   "heartable_type"
    t.integer  "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "hearts", ["heartable_id", "heartable_type"], :name => "index_hearts_on_heartable_id_and_heartable_type"
  add_index "hearts", ["heartable_id"], :name => "index_hearts_on_heartable_id"
  add_index "hearts", ["heartable_type"], :name => "index_hearts_on_heartable_type"
  add_index "hearts", ["user_id"], :name => "index_hearts_on_user_id"

  create_table "links", :force => true do |t|
    t.integer  "pos_x"
    t.integer  "pos_y"
    t.integer  "width"
    t.integer  "height"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "page_version_id"
  end

  add_index "links", ["page_version_id"], :name => "index_links_on_page_version_id"

  create_table "page_versions", :force => true do |t|
    t.integer  "version"
    t.integer  "page_id"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "page_versions", ["page_id"], :name => "index_page_versions_on_page_id"
  add_index "page_versions", ["version"], :name => "index_page_versions_on_version"

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "prototype_id"
    t.integer  "sort"
  end

  add_index "pages", ["prototype_id"], :name => "index_pages_on_prototype_id"
  add_index "pages", ["sort"], :name => "index_pages_on_sort"

  create_table "prototypes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.text     "description"
    t.string   "permalink"
  end

  add_index "prototypes", ["permalink"], :name => "index_prototypes_on_permalink"
  add_index "prototypes", ["user_id"], :name => "index_prototypes_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "uid"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "users", ["uid"], :name => "index_users_on_uid"

  create_table "views", :force => true do |t|
    t.integer  "viewable_id"
    t.string   "viewable_type"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "views", ["user_id"], :name => "index_views_on_user_id"
  add_index "views", ["viewable_id", "viewable_type"], :name => "index_views_on_viewable_id_and_viewable_type"
  add_index "views", ["viewable_id"], :name => "index_views_on_viewable_id"
  add_index "views", ["viewable_type"], :name => "index_views_on_viewable_type"

end
