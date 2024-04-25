json.extract! item, :id, :description, :units_of_measure, :unit_cost, :unit_price, :inventory, :shelf_no, :item_category, :created_at, :updated_at
json.url item_url(item, format: :json)
