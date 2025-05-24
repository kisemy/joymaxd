json.extract! salesquote_line, :id, :charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount, :created_at, :updated_at
json.url salesquote_line_url(salesquote_line, format: :json)
