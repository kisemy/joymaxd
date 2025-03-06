json.extract! sales_quote, :id, :QTN_no, :customer_no, :customer_name, :contactno, :contact_name, :address, :city, :quote_date, :sales_person_code, :sales_person_name, :created_at, :updated_at
json.url sales_quote_url(sales_quote, format: :json)
