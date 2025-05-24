json.extract! supplier, :id, :supplier_name, :address, :city, :contact, :telephone, :email, :posting_group, :created_at, :updated_at
json.url supplier_url(supplier, format: :json)
