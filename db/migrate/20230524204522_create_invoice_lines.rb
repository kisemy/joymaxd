class CreateInvoiceLines < ActiveRecord::Migration[6.0]
  def change
    create_table :invoice_lines do |t|
      t.text :charge_type
      t.text :item_no
      t.text :description
      t.decimal :quantity
      t.text :unit_of_measure
      t.decimal :unit_price
      t.decimal :amount
      t.references :invoice, null: false, foreign_key: true

      t.timestamps
    end
  end
end
