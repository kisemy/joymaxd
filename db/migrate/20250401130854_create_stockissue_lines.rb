class CreateStockissueLines < ActiveRecord::Migration[6.0]
  def change
      create_table :stockissue_lines do |t|
      t.string :code
      t.text :product_description
      t.decimal :issued_quantity
      t.decimal :unit_cost
      t.decimal :amount
      t.boolean :issued
      t.decimal :stock_balance
      t.date :expiry_date
      t.string :batch_no
      t.boolean :expired
      t.decimal :batch_quantity
      t.string :client_code
      t.date :latest_expiry
      t.text :client_name
      t.bigint :stockoutheader_id, null: false  # Explicit column definition

      t.timestamps
    end

    # Add foreign key constraint manually
    add_foreign_key :stockissue_lines, :stockout_headers, 
                    column: :stockoutheader_id, 
                    primary_key: :stko
    
  end
end
