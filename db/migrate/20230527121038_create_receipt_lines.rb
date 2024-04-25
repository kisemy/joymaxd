class CreateReceiptLines < ActiveRecord::Migration[6.0]
  def change
    create_table :receipt_lines do |t|
      t.date :receipt_date
      t.text :receipt_account
      t.text :account_type
      t.text :account_no
      t.text :account_name
      t.decimal :amount
      t.text :invoiceno
      t.references :receipt, null: false, foreign_key: true

      t.timestamps
    end
  end
end
