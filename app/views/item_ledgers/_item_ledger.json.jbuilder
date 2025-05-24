json.extract! item_ledger, :id, :item_no, :posting_date, :document_no, :source_no, :description, :quantity, :created_at, :updated_at
json.url item_ledger_url(item_ledger, format: :json)
