json.extract! sales_order, :id, :order_no, :customer_no, :customer_name, :contactno, :contact_name, :address, :city, :order_date, :sales_person_code, :sales_person_name, :created_at, :updated_at
json.url sales_order_url(sales_order, format: :json)
