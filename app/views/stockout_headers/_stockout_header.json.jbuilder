json.extract! stockout_header, :id, :stko, :request_no, :client_code, :client_name, :address, :email, :telephone, :client_category, :status, :warehouse_code, :warehouse_name, :request_date, :release_date, :requested_by, :issued, :created_at, :updated_at
json.url stockout_header_url(stockout_header, format: :json)
