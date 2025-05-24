json.extract! stockissue_line, :id, :code, :product_description, :issued_quantity, :unit_cost, :amount, :issued, :stock_balance, :expiry_date, :batch_no, :expired, :batch_quantity, :client_code, :latest_expiry, :client_name, :stockout_header_id, :created_at, :updated_at
json.url stockissue_line_url(stockissue_line, format: :json)
