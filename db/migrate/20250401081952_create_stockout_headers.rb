class CreateStockoutHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :stockout_headers, id: false do |t|
      t.primary_key :stko
      t.string :request_no
      t.string :client_code
      t.text :client_name
      t.text :address
      t.text :email
      t.text :telephone
      t.text :client_category
      t.string :status
      t.string :warehouse_code
      t.text :warehouse_name
      t.date :request_date
      t.date :release_date
      t.string :requested_by
      t.boolean :issued

      t.timestamps
    end
  end
end
