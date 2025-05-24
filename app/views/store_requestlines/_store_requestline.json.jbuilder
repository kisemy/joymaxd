json.extract! store_requestline, :id, :code, :product_description, :quantity, :unit_cost, :amount, :received, :expiry_date, :batch_no, :stock_balance, :destination_code, :destination_name, :store_request_id, :created_at, :updated_at
json.url store_requestline_url(store_requestline, format: :json)
