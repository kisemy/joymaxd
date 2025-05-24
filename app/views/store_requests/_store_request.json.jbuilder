json.extract! store_request, :id, :invoice_no, :request_date, :destination_code, :destination_name, :status, :warehouse_code, :Warehouse_name, :requsted_by, :request_status, :delivery_place, :created_at, :updated_at
json.url store_request_url(store_request, format: :json)
