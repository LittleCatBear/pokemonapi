# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_06_08_235509) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "generations", force: :cascade do |t|
    t.integer "number", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.integer "number", null: false
    t.string "name", null: false
    t.integer "total", null: false
    t.integer "hp", null: false
    t.integer "attack", null: false
    t.integer "defense", null: false
    t.integer "sp_atk", null: false
    t.integer "sp_def", null: false
    t.integer "speed", null: false
    t.boolean "legendary", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "type1_id", null: false
    t.bigint "type2_id"
    t.bigint "generation_id", null: false
    t.index ["generation_id"], name: "index_pokemons_on_generation_id"
    t.index ["type1_id"], name: "index_pokemons_on_type1_id"
    t.index ["type2_id"], name: "index_pokemons_on_type2_id"
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pokemons", "generations"
  add_foreign_key "pokemons", "types", column: "type1_id"
  add_foreign_key "pokemons", "types", column: "type2_id"
end
