json.extract! receipt, :id, :receipt_date, :bank_code, :description, :received_by, :receipt_by, :receipt_mode, :receipt_description, :status, :document_no, :amount, :received_from, :account_type, :accountno, :created_at, :updated_at
json.url receipt_url(receipt, format: :json)
