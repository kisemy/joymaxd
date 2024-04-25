class CreatePaymentlines < ActiveRecord::Migration[6.0]
  def change
    create_table :paymentlines do |t|
      t.text :paying_account
      t.text :account_type
      t.text :accountno
      t.text :accountname
      t.decimal :amount
      t.text :description
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
