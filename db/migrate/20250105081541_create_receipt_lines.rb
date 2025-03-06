class CreateReceiptLines < ActiveRecord::Migration[6.0]
  def change
    create_table :receipt_lines do |t|
      t.text :receipt_account
      t.string :account_type
      t.text :account_no
      t.text :account_name
      t.decimal :amount
      t.text :invoiceno
      t.string :bank_name
      t.string :customer_name
      t.string :chart_of_account_name
      t.references :receipt, null: false, foreign_key: true
    end
  end
end
