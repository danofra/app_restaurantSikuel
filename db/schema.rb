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

ActiveRecord::Schema[7.2].define(version: 2024_10_07_003247) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dish_ingredients", force: :cascade do |t|
    t.integer "dish_id"
    t.integer "ingredient_id"
  end

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "dishes_orders", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "dish_id", null: false
    t.index ["dish_id"], name: "index_dishes_orders_on_dish_id"
    t.index ["order_id"], name: "index_dishes_orders_on_order_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.integer "stock"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "order_dishes", force: :cascade do |t|
    t.integer "order_id"
    t.integer "dish_id"
  end

  create_table "order_tables", force: :cascade do |t|
    t.integer "order_id"
    t.integer "table_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "table_id", null: false
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["table_id"], name: "index_orders_on_table_id"
  end

  create_table "orders_dishes", id: false, force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "dish_id", null: false
    t.index ["dish_id"], name: "index_orders_dishes_on_dish_id"
    t.index ["order_id"], name: "index_orders_dishes_on_order_id"
  end

  create_table "tables", force: :cascade do |t|
    t.integer "number"
    t.boolean "available"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "orders", "tables"
  add_foreign_key "orders_dishes", "dishes"
  add_foreign_key "orders_dishes", "orders"
end
