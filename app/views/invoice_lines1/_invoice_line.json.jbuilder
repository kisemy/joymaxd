json.extract! invoice_line, :id, :charge_type, :item_no, :description, :quantity, :unit_of_measure, :unit_price, :amount, :invoice_id, :created_at, :updated_at
json.url invoice_line_url(invoice_line, format: :json)
