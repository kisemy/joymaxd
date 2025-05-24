class CreateStoreRequestlines < ActiveRecord::Migration[6.0]
  def change
    create_table :store_requestlines do |t|
      t.string :code
      t.text :product_description
      t.decimal :quantity
      t.decimal :unit_cost
      t.decimal :amount
      t.boolean :received
      t.date :expiry_date
      t.string :batch_no
      t.decimal :stock_balance
      t.string :destination_code
      t.text :destination_name
      t.references :store_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
