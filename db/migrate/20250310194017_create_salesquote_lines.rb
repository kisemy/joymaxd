class CreateSalesquoteLines < ActiveRecord::Migration[6.0]
  def change
      create_table :salesquote_lines do |t|
      t.text :charge_type
      t.text :item_no
      t.text :description
      t.integer :quantity
      t.text :unit_of_measure
      t.decimal :unit_price
      t.decimal :amount

      # Add foreign key referencing `QTN_no` in `sales_quotes`
      t.string :QTN_no, null: false
      t.foreign_key :sales_quotes, column: :QTN_no, primary_key: :QTN_no

      t.timestamps
    end

    # Add an index for the foreign key
    add_index :salesquote_lines, :QTN_no
  end
      

end
