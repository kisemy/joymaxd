json.extract! salesperson, :id, :name, :email, :phone_no, :job_title, :total_sales, :commission, :created_at, :updated_at
json.url salesperson_url(salesperson, format: :json)
