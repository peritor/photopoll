# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090829151822) do

  create_table "photos", :force => true do |t|
    t.string   "name"
    t.string   "body_file_name"
    t.string   "body_content_type"
    t.integer  "body_file_size"
    t.datetime "body_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ratings", :force => true do |t|
    t.integer  "photo_id"
    t.integer  "value"
    t.text     "comment"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ratings", ["photo_id", "created_at"], :name => "index_ratings_on_photo_id_and_created_at"

end
