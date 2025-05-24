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

ActiveRecord::Schema.define(version: 2025_05_22_085720) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_types", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "bankgroups", force: :cascade do |t|
    t.text "code"
    t.text "description"
    t.text "gl_account"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "banks", force: :cascade do |t|
    t.text "bank_name"
    t.text "bank_acc_no"
    t.text "posting_group"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "glaccount"
    t.string "bankgroup"
    t.string "description"
  end

  create_table "cashes", force: :cascade do |t|
    t.text "cash_name"
    t.text "posting_group"
    t.decimal "balance"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "categories", force: :cascade do |t|
    t.text "default_description"
    t.text "default_price"
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

  create_table "chart_of_accounts", primary_key: "no", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "accounttype"
    t.text "account_category"
    t.decimal "debit", precision: 15, scale: 2
    t.decimal "credit", precision: 15, scale: 2
    t.decimal "balance", precision: 15, scale: 2
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "postable"
  end

  create_table "customers", primary_key: "clientcode", id: :string, force: :cascade do |t|
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

  create_table "departments", primary_key: "department_code", id: :string, force: :cascade do |t|
    t.text "department_name"
    t.string "current_CEC_p_no"
    t.text "current_CEC_name"
    t.string "current_CEC_telephone"
    t.text "current_CEC_email"
    t.text "general_dept_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "financial_years", force: :cascade do |t|
    t.string "code"
    t.text "description"
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

  create_table "internal_supplies", force: :cascade do |t|
    t.text "supplier_name"
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
    t.string "customer_no"
    t.index ["customer_no"], name: "index_invoices_on_customer_no"
  end

  create_table "item_ledgers", force: :cascade do |t|
    t.string "item_no"
    t.date "posting_date"
    t.string "document_no"
    t.string "source_no"
    t.text "description"
    t.decimal "quantity"
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
    t.string "sales_account"
    t.string "sales_acc_name"
    t.string "cost_account"
    t.string "cost_acc_name"
    t.string "purchase_account"
    t.string "purchase_acc_name"
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

  create_table "permissions", force: :cascade do |t|
    t.string "action"
    t.string "subject_class"
    t.integer "subject_id"
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
    t.integer "category_id"
  end

  create_table "programmes", id: false, force: :cascade do |t|
    t.string "programme_code", null: false
    t.text "section_name"
    t.string "department_code"
    t.text "department_name"
    t.string "current_co_pno"
    t.string "current_co_telephone"
    t.text "current_co_email"
    t.text "general_programme_email"
    t.decimal "complete_projects"
    t.decimal "projects_in_progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "programme_name"
    t.index ["programme_code"], name: "index_programmes_on_programme_code", unique: true
  end

  create_table "project_tasks", primary_key: "task_no", id: :string, force: :cascade do |t|
    t.string "auto_no"
    t.string "p_tsk_01"
    t.text "task_description"
    t.string "project_no"
    t.date "planned_start_date"
    t.date "planned_end_date"
    t.date "actual_start_date"
    t.date "actual_end_date"
    t.integer "planned_task_duration"
    t.integer "actual_task_duration"
    t.decimal "percentage_coverage_planned"
    t.decimal "percentage_coverage"
    t.boolean "parallel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "completed", default: false
  end

  create_table "projects", primary_key: "project_no", id: :string, force: :cascade do |t|
    t.text "project_name"
    t.string "financial_year"
    t.text "brief_description"
    t.string "department"
    t.decimal "budgeted"
    t.decimal "actual"
    t.decimal "longitude"
    t.decimal "latitude"
    t.date "start_date"
    t.date "end_date"
    t.string "project_status"
    t.string "sub_county"
    t.string "ward"
    t.string "village"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "department_code"
    t.string "programme_code"
    t.text "programme_name"
    t.string "sub_programme_code"
    t.text "sub_programme_name"
    t.decimal "percent_completed", precision: 5, scale: 2, default: "0.0"
    t.string "sub_county_code"
    t.string "ward_code", limit: 10
    t.string "village_code"
  end

  create_table "receipt_lines", force: :cascade do |t|
    t.text "receipt_account"
    t.string "account_type"
    t.text "account_no"
    t.text "account_name"
    t.decimal "amount"
    t.text "invoiceno"
    t.string "bank_name"
    t.string "customer_name"
    t.string "chart_of_account_name"
    t.bigint "receipt_id", null: false
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
    t.string "glaccount"
    t.boolean "posted"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales_orders", primary_key: "order_no", id: :string, force: :cascade do |t|
    t.string "customer_no"
    t.string "customer_name"
    t.string "contactno"
    t.string "contact_name"
    t.string "address"
    t.string "city"
    t.date "order_date"
    t.string "sales_person_code"
    t.string "sales_person_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales_quotes", primary_key: "QTN_no", id: :string, force: :cascade do |t|
    t.string "customer_no"
    t.string "customer_name"
    t.string "contactno"
    t.string "contact_name"
    t.string "address"
    t.string "city"
    t.date "quote_date"
    t.string "sales_person_code"
    t.string "sales_person_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "salesorder_lines", force: :cascade do |t|
    t.text "charge_type"
    t.text "item_no"
    t.text "description"
    t.integer "quantity"
    t.text "unit_of_measure"
    t.decimal "unit_price"
    t.decimal "amount"
    t.string "order_no", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_no"], name: "index_salesorder_lines_on_order_no"
  end

  create_table "salespeople", id: :string, force: :cascade do |t|
    t.text "name"
    t.text "email"
    t.text "phone_no"
    t.text "job_title"
    t.decimal "total_sales"
    t.decimal "commission"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["id"], name: "index_salespeople_on_id", unique: true
  end

  create_table "salesquote_lines", force: :cascade do |t|
    t.text "charge_type"
    t.text "item_no"
    t.text "description"
    t.integer "quantity"
    t.text "unit_of_measure"
    t.decimal "unit_price"
    t.decimal "amount"
    t.string "QTN_no", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["QTN_no"], name: "index_salesquote_lines_on_QTN_no"
  end

  create_table "sections", primary_key: "section_code", id: :string, force: :cascade do |t|
    t.text "section_name"
    t.text "current_co_name"
    t.string "current_co_telephone"
    t.text "current_co_email"
    t.text "general_section_email"
    t.string "department_code"
    t.text "department_name"
    t.decimal "complete_projects"
    t.decimal "projects_in_progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stockin_headers", primary_key: "stk_no", id: :string, force: :cascade do |t|
    t.string "invoice_no"
    t.date "received_date"
    t.string "supplier_code"
    t.text "supplier_name"
    t.text "supplier_address"
    t.text "supplier_email"
    t.string "telephone"
    t.string "donor"
    t.text "donor_name"
    t.string "project_code"
    t.text "project_name"
    t.string "warehouse_location_code"
    t.text "warehouse_location_name"
    t.text "source_code"
    t.text "source_name"
    t.text "source_address"
    t.text "source_email"
    t.text "source_telephone"
    t.text "source_type"
    t.text "PO_no"
    t.text "received_by"
    t.boolean "received"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "posted", default: false
    t.index ["stk_no"], name: "index_stockin_headers_on_stk_no", unique: true
  end

  create_table "stockissue_lines", force: :cascade do |t|
    t.string "code"
    t.text "product_description"
    t.decimal "issued_quantity"
    t.decimal "unit_cost"
    t.decimal "amount"
    t.boolean "issued"
    t.decimal "stock_balance"
    t.date "expiry_date"
    t.string "batch_no"
    t.boolean "expired"
    t.decimal "batch_quantity"
    t.string "client_code"
    t.date "latest_expiry"
    t.text "client_name"
    t.bigint "stockoutheader_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "stocklines", force: :cascade do |t|
    t.string "code"
    t.text "product_description"
    t.decimal "quantity"
    t.decimal "unit_cost"
    t.decimal "unit_price"
    t.decimal "amount"
    t.boolean "received"
    t.date "expiry_date"
    t.string "batch_no"
    t.string "product_category"
    t.date "date"
    t.string "unit_of_measure"
    t.string "warehouse_code"
    t.text "warehouse_name"
    t.decimal "quantity_expected"
    t.string "quality_check"
    t.text "comment"
    t.string "ref_no"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "stk_no", null: false
    t.string "inventory_account"
    t.index ["stk_no"], name: "index_stocklines_on_stk_no"
  end

  create_table "stockout_headers", primary_key: "stko", force: :cascade do |t|
    t.string "request_no"
    t.string "client_code"
    t.text "client_name"
    t.text "address"
    t.text "email"
    t.text "telephone"
    t.text "client_category"
    t.string "status"
    t.string "warehouse_code"
    t.text "warehouse_name"
    t.date "request_date"
    t.date "release_date"
    t.string "requested_by"
    t.boolean "issued"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "store_requestlines", force: :cascade do |t|
    t.string "code"
    t.text "product_description"
    t.decimal "quantity"
    t.decimal "unit_cost"
    t.decimal "amount"
    t.boolean "received"
    t.date "expiry_date"
    t.string "batch_no"
    t.decimal "stock_balance"
    t.string "destination_code"
    t.text "destination_name"
    t.bigint "store_request_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["store_request_id"], name: "index_store_requestlines_on_store_request_id"
  end

  create_table "store_requests", force: :cascade do |t|
    t.string "invoice_no"
    t.date "request_date"
    t.text "destination_code"
    t.text "destination_name"
    t.string "status"
    t.text "warehouse_code"
    t.text "Warehouse_name"
    t.text "requsted_by"
    t.text "request_status"
    t.text "delivery_place"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "destination_type"
    t.index ["destination_type"], name: "index_store_requests_on_destination_type"
  end

  create_table "sub_counties", primary_key: "sub_county_code", id: :string, force: :cascade do |t|
    t.text "sub_county_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sub_sections", primary_key: "sub_section_code", id: :string, force: :cascade do |t|
    t.text "sub_section_name"
    t.string "section_code"
    t.text "section_name"
    t.string "department_code"
    t.text "department_name"
    t.decimal "complete_projects"
    t.decimal "projects_in_progress"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "suppliers", primary_key: "s_no", id: :string, force: :cascade do |t|
    t.text "supplier_name"
    t.text "address"
    t.text "city"
    t.string "contact"
    t.string "telephone"
    t.text "email"
    t.string "posting_group"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_roles", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["role_id"], name: "index_user_roles_on_role_id"
    t.index ["user_id"], name: "index_user_roles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "villages", primary_key: "village_code", id: :string, force: :cascade do |t|
    t.text "village_name"
    t.string "sub_county_code"
    t.text "sub_county_name"
    t.string "ward_code"
    t.text "ward_name"
    t.string "village_admin_pno"
    t.text "village_admin_name"
    t.string "village_admin_telephone"
    t.text "village_admin_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wards", primary_key: "ward_code", id: :string, force: :cascade do |t|
    t.text "ward_name"
    t.string "ward_admin_pno"
    t.text "ward_admin_name"
    t.string "ward_admin_telephone"
    t.text "ward_admin_email"
    t.string "sub_county_code"
    t.text "sub_county_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "warehouses", force: :cascade do |t|
    t.text "warehouse_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "invoice_lines", "invoices"
  add_foreign_key "paymentlines", "payments"
  add_foreign_key "receipt_lines", "receipts"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "salesorder_lines", "sales_orders", column: "order_no", primary_key: "order_no"
  add_foreign_key "salesquote_lines", "sales_quotes", column: "QTN_no", primary_key: "QTN_no"
  add_foreign_key "stockissue_lines", "stockout_headers", column: "stockoutheader_id", primary_key: "stko"
  add_foreign_key "stocklines", "stockin_headers", column: "stk_no", primary_key: "stk_no"
  add_foreign_key "store_requestlines", "store_requests"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end
