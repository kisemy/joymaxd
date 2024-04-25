json.extract! payment, :id, :payment_date, :paying_account_code, :paying_acc_description, :prepared_by, :mode_of_payment, :payment_description, :status, :documentno, :release_date, :posted, :amount, :payee_code, :payee_name, :account_type, :category_type, :created_at, :updated_at
json.url payment_url(payment, format: :json)
