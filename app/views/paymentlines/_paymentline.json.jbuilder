json.extract! paymentline, :id, :paying_account, :account_type, :accountno, :accountname, :amount, :description, :payment_id, :created_at, :updated_at
json.url paymentline_url(paymentline, format: :json)
