json.extract! gledger, :id, :accountno, :date, :documentno, :description, :amount, :sourcetype, :sourceno, :created_at, :updated_at
json.url gledger_url(gledger, format: :json)
