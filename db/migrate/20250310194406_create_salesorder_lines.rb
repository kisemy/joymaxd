class CreateSalesorderLines < ActiveRecord::Migration[6.0]
  def change
     create_table :salesorder_lines do |t|
      t.text :charge_type
      t.text :item_no
      t.text :description
      t.integer :quantity
      t.text :unit_of_measure
      t.decimal :unit_price
      t.decimal :amount

      # Add foreign key referencing `order_no` in `sales_orders`
      t.string :order_no, null: false
      t.foreign_key :sales_orders, column: :order_no, primary_key: :order_no

      t.timestamps
    end

    # Add an index for the foreign key
    add_index :salesorder_lines, :order_no
  end
 
end


