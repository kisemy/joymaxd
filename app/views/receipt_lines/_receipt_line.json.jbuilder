json.extract! receipt_line, :id, :receipt_date, :receipt_account, :account_type, :account_no, :account_name, :amount, :invoiceno, :receipt_id, :created_at, :updated_at
json.url receipt_line_url(receipt_line, format: :json)
