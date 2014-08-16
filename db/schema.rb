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

ActiveRecord::Schema.define(version: 20140816200551) do

  create_table "pokemon", force: true do |t|
    t.string  "name"
    t.integer "pokedex_id"
  end

  create_table "pokemon_types", force: true do |t|
    t.integer "pokemon_id"
    t.integer "type_id"
  end

  create_table "type_efficacies", force: true do |t|
    t.integer "target_type_id"
    t.integer "damage_type_id"
  end

  create_table "types", force: true do |t|
    t.string  "name"
    t.integer "pokedex_type_id"
  end

end
