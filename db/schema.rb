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

ActiveRecord::Schema.define(version: 20150224234936) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string   "name"
    t.integer  "mana_cost"
    t.integer  "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "character_classes", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "characters", force: :cascade do |t|
    t.string   "name"
    t.integer  "constitution"
    t.integer  "health"
    t.integer  "damage"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "party_id"
    t.integer  "character_class_id"
  end

  add_index "characters", ["character_class_id"], name: "index_characters_on_character_class_id", using: :btree
  add_index "characters", ["party_id"], name: "index_characters_on_party_id", using: :btree

  create_table "enchantments", force: :cascade do |t|
    t.integer  "ability_id"
    t.integer  "character_class_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "enchantments", ["ability_id"], name: "index_enchantments_on_ability_id", using: :btree
  add_index "enchantments", ["character_class_id"], name: "index_enchantments_on_character_class_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "cost"
    t.integer  "encumberance"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "locations", force: :cascade do |t|
    t.string   "name"
    t.integer  "x_coord"
    t.integer  "y_coord"
    t.string   "terrain"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.string   "species"
    t.integer  "health"
    t.integer  "damage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "mounts", force: :cascade do |t|
    t.string   "name"
    t.string   "species"
    t.boolean  "flying"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "character_id"
  end

  add_index "mounts", ["character_id"], name: "index_mounts_on_character_id", using: :btree

  create_table "parties", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "special_items", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_foreign_key "characters", "character_classes"
  add_foreign_key "characters", "parties"
  add_foreign_key "enchantments", "abilities"
  add_foreign_key "enchantments", "character_classes"
  add_foreign_key "mounts", "characters"
end
