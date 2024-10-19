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

ActiveRecord::Schema[7.2].define(version: 2024_08_29_110008) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "advances", force: :cascade do |t|
    t.float "amount"
    t.float "payment"
    t.date "start_date"
    t.date "end_date"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_advances_on_employee_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.string "branch"
    t.string "iban"
    t.bigint "employee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_banks_on_employee_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.date "start_date"
    t.date "end_date"
    t.float "salary"
    t.boolean "active"
    t.bigint "employee_id"
    t.bigint "position_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["employee_id"], name: "index_contracts_on_employee_id"
    t.index ["position_id"], name: "index_contracts_on_position_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "first_name"
    t.string "father_name"
    t.string "grandfather_name"
    t.string "family_name"
    t.string "ar_first_name"
    t.string "ar_father_name"
    t.string "ar_grandfather_name"
    t.string "ar_family_name"
    t.string "nid"
    t.string "email"
    t.string "phone_number"
    t.string "e_phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "national", default: true
    t.string "nationality"
    t.string "passport_number"
  end

  create_table "paycuts", force: :cascade do |t|
    t.string "reason"
    t.boolean "recurring"
    t.float "amount"
    t.float "percent_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
