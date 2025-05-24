json.extract! salesorder_line, :id, :charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount, :created_at, :updated_at
json.url salesorder_line_url(salesorder_line, format: :json)
