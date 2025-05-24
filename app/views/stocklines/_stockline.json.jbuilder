json.extract! stockline, :id, :stockin_headers_id, :code, :product_description, :quantity, :unit_cost, :unit_price, :amount, :received, :expiry_date, :batch_no, :product_category, :date, :unit_of_measure, :warehouse_code, :warehouse_name, :quantity_expected, :quality_check, :comment, :ref_no, :created_at, :updated_at
json.url stockline_url(stockline, format: :json)
