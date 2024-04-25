# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_11_28_203749) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "banks", force: :cascade do |t|
    t.text "bank_name"
    t.text "bank_acc_no"
    t.text "posting_group"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cashes", force: :cascade do |t|
    t.text "cash_name"
    t.text "posting_group"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "charge_types", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "chargetypes", force: :cascade do |t|
    t.text "code"
    t.text "charge_description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.text "customer_name"
    t.text "contactno"
    t.text "contact_name"
    t.text "address"
    t.text "city"
    t.date "date"
    t.text "sales_person_code"
    t.text "sales_person_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gledgers", force: :cascade do |t|
    t.text "accountno"
    t.date "date"
    t.text "documentno"
    t.text "description"
    t.decimal "amount"
    t.text "sourcetype"
    t.text "sourceno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.text "charge_type"
    t.text "item_no"
    t.text "description"
    t.decimal "quantity"
    t.text "unit_of_measure"
    t.decimal "unit_price"
    t.decimal "amount"
    t.bigint "invoice_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["invoice_id"], name: "index_invoice_lines_on_invoice_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.text "customer_name"
    t.text "contactno"
    t.text "contact_name"
    t.text "address"
    t.text "city"
    t.date "date"
    t.text "sales_person_code"
    t.text "sales_person_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.text "description"
    t.text "units_of_measure"
    t.decimal "unit_cost"
    t.text "unit_price"
    t.decimal "inventory"
    t.text "shelf_no"
    t.text "item_category"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "paymentlines", force: :cascade do |t|
    t.text "paying_account"
    t.text "account_type"
    t.text "accountno"
    t.text "accountname"
    t.decimal "amount"
    t.text "description"
    t.bigint "payment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_id"], name: "index_paymentlines_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.date "payment_date"
    t.text "paying_account_code"
    t.text "paying_acc_description"
    t.text "prepared_by"
    t.text "mode_of_payment"
    t.text "payment_description"
    t.text "status"
    t.text "documentno"
    t.date "release_date"
    t.text "posted"
    t.decimal "amount"
    t.text "payee_code"
    t.text "payee_name"
    t.text "account_type"
    t.text "category_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.integer "price"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "receipt_lines", force: :cascade do |t|
    t.date "receipt_date"
    t.text "receipt_account"
    t.text "account_type"
    t.text "account_no"
    t.text "account_name"
    t.decimal "amount"
    t.text "invoiceno"
    t.bigint "receipt_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["receipt_id"], name: "index_receipt_lines_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.date "receipt_date"
    t.text "bank_code"
    t.text "description"
    t.text "received_by"
    t.text "receipt_by"
    t.text "receipt_mode"
    t.text "receipt_description"
    t.text "status"
    t.text "document_no"
    t.decimal "amount"
    t.text "received_from"
    t.text "account_type"
    t.text "accountno"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "invoice_lines", "invoices"
  add_foreign_key "paymentlines", "payments"
  add_foreign_key "receipt_lines", "receipts"
end
