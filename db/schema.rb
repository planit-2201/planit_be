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

ActiveRecord::Schema[7.0].define(version: 2022_07_16_164418) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_data", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "daily_records", force: :cascade do |t|
    t.string "date"
    t.integer "bag_count", default: 0
    t.integer "bottle_count", default: 0
    t.integer "straw_count", default: 0
    t.integer "shower_time", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_daily_records_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.float "flowrate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "daily_records", "users"
end
