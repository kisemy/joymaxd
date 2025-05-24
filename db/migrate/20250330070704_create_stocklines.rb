class CreateStocklines < ActiveRecord::Migration[6.0]
  def change
    create_table :stocklines do |t|
      t.string :stockin_header_id # Match the type of stk_no
      t.string :code
      t.text :product_description
      t.decimal :quantity
      t.decimal :unit_cost
      t.decimal :unit_price
      t.decimal :amount
      t.boolean :received
      t.date :expiry_date
      t.string :batch_no
      t.string :product_category
      t.date :date
      t.string :unit_of_measure
      t.string :warehouse_code
      t.text :warehouse_name
      t.decimal :quantity_expected
      t.string :quality_check
      t.text :comment
      t.string :ref_no

      t.timestamps
    end

    add_foreign_key :stocklines, :stockin_headers, 
                    column: :stockin_header_id, 
                    primary_key: :stk_no,
                    type: :string
  end
end
