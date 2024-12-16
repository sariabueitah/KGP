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

ActiveRecord::Schema[8.0].define(version: 2024_12_16_164258) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "allowances", force: :cascade do |t|
    t.string "name"
    t.string "ar_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.boolean "national", default: true
    t.string "nationality"
    t.string "passport_number"
    t.string "social_security_number"
    t.string "income_tax_number"
    t.integer "marital_status"
    t.boolean "has_dependants"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string "message"
    t.string "type"
    t.string "notifiable_type"
    t.bigint "notifiable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["notifiable_type", "notifiable_id"], name: "index_notifications_on_notifiable"
  end

  create_table "positions", force: :cascade do |t|
    t.string "title"
    t.string "ar_title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salary_allowances", force: :cascade do |t|
    t.bigint "allowance_id"
    t.float "amount"
    t.boolean "tax_deductible"
    t.boolean "social_security_deductible"
    t.bigint "contract_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["allowance_id"], name: "index_salary_allowances_on_allowance_id"
    t.index ["contract_id"], name: "index_salary_allowances_on_contract_id"
  end
end
