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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140616093255) do

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manufacturers", ["part_id"], name: "index_manufacturers_on_part_id"

  create_table "parts", force: true do |t|
    t.string   "title"
    t.string   "number"
    t.string   "image_url"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "product_id"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "properties", force: true do |t|
    t.string   "name"
    t.string   "value"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["product_id"], name: "index_properties_on_product_id"

  create_table "stores", force: true do |t|
    t.string   "name"
    t.string   "location"
    t.string   "store_keeper"
    t.string   "quantity"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time_received"
  end

  add_index "stores", ["part_id"], name: "index_stores_on_part_id"

  create_table "subcategories", force: true do |t|
    t.integer  "product_id"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subcategories", ["product_id"], name: "index_subcategories_on_product_id"

  create_table "suppliers", force: true do |t|
    t.string   "name"
    t.string   "country"
    t.integer  "part_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "suppliers", ["part_id"], name: "index_suppliers_on_part_id"

  create_table "uses", force: true do |t|
    t.integer  "part_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "uses", ["part_id"], name: "index_uses_on_part_id"

end
