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

ActiveRecord::Schema[8.1].define(version: 2026_02_18_210025) do
  create_table "action_push_native_devices", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "owner_id"
    t.string "owner_type"
    t.string "platform", null: false
    t.string "token", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_type", "owner_id"], name: "index_action_push_native_devices_on_owner"
  end

  create_table "categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.string "image_url"
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
  end

  create_table "order_item_extras", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.integer "order_item_id", null: false
    t.integer "price", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["order_item_id"], name: "index_order_item_extras_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "milk"
    t.integer "order_id", null: false
    t.integer "product_id", null: false
    t.integer "quantity", default: 1, null: false
    t.string "size", default: "medium", null: false
    t.integer "unit_price", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_order_items_on_order_id"
    t.index ["product_id"], name: "index_order_items_on_product_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "placed_at"
    t.string "status", default: "cart", null: false
    t.integer "total", default: 0, null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "products", force: :cascade do |t|
    t.integer "base_price"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.string "description"
    t.string "image_url"
    t.string "name"
    t.integer "position"
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_products_on_category_id"
  end

  create_table "reward_activities", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "description"
    t.integer "points"
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_reward_activities_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email"
    t.string "favorite_store"
    t.string "name"
    t.string "password_digest"
    t.integer "reward_points", default: 0, null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "order_item_extras", "order_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "order_items", "products"
  add_foreign_key "orders", "users"
  add_foreign_key "products", "categories"
  add_foreign_key "reward_activities", "users"
end
