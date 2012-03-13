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

ActiveRecord::Schema.define(:version => 20120313182924) do

  create_table "farms", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "farms", ["id"], :name => "index_farms_on_id"

  create_table "growth_stages", :force => true do |t|
    t.integer  "_max_bound"
    t.integer  "_min_bound"
    t.boolean  "_is_collectable"
    t.integer  "image_info_id"
    t.integer  "plant_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "growth_stages", ["id"], :name => "index_growth_stages_on_id"

  create_table "image_infos", :force => true do |t|
    t.string   "_file_path"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "image_infos", ["id"], :name => "index_image_infos_on_id"

  create_table "plant_types", :force => true do |t|
    t.string   "_name"
    t.integer  "image_info_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plant_types", ["id"], :name => "index_plant_types_on_id"

  create_table "plants", :force => true do |t|
    t.integer  "_x"
    t.integer  "_y"
    t.integer  "_life_time"
    t.integer  "farm_id"
    t.integer  "plant_type_id"
    t.integer  "growth_stage_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plants", ["farm_id"], :name => "index_plants_on_farm_id"
  add_index "plants", ["id"], :name => "index_plants_on_id"

end
