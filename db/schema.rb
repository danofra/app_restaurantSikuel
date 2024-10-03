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

ActiveRecord::Schema[7.2].define(version: 2024_10_03_004708) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_ingredients", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "ingredient_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.bigint "dish_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_orders_on_dish_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "number"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "orders", "dishes"
  add_foreign_key "orders", "tables"
end
