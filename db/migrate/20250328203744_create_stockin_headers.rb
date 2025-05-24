class CreateStockinHeaders < ActiveRecord::Migration[6.0]
  def change
    create_table :stockin_headers, id: false do |t|
      t.string :stk_no, primary_key: true
      t.string :invoice_no
      t.date :received_date
      t.string :supplier_code
      t.text :supplier_name
      t.text :supplier_address
      t.text :supplier_email
      t.string :telephone
      t.string :donor
      t.text :donor_name
      t.string :project_code
      t.text :project_name
      t.string :warehouse_location_code
      t.text :warehouse_location_name
      t.text :source_code
      t.text :source_name
      t.text :source_address
      t.text :source_email
      t.text :source_telephone
      t.text :source_type
      t.text :PO_no
      t.text :received_by
      t.boolean :received

      t.timestamps
    end
    add_index :stockin_headers, :stk_no, unique: true
  end
end
