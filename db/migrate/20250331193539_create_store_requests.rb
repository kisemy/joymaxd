class CreateStoreRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :store_requests do |t|
      t.string :invoice_no
      t.date :request_date
      t.text :destination_code
      t.text :destination_name
      t.string :status
      t.text :warehouse_code
      t.text :Warehouse_name
      t.text :requsted_by
      t.text :request_status
      t.text :delivery_place

      t.timestamps
    end
  end
end
