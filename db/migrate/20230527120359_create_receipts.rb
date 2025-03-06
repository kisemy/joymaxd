class CreateReceipts < ActiveRecord::Migration[6.0]
  def change
    create_table :receipts do |t|
      t.date :receipt_date
      t.text :bank_code
      t.text :description
      t.text :received_by
      t.text :receipt_by
      t.text :receipt_mode
      t.text :receipt_description
      t.text :status
      t.text :document_no
      t.decimal :amount
      t.text :received_from
      t.text :account_type
      t.text :accountno

      t.timestamps
    end
  end
end
