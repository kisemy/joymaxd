class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.date :payment_date
      t.text :paying_account_code
      t.text :paying_acc_description
      t.text :prepared_by
      t.text :mode_of_payment
      t.text :payment_description
      t.text :status
      t.text :documentno
      t.date :release_date
      t.text :posted
      t.decimal :amount
      t.text :payee_code
      t.text :payee_name
      t.text :account_type
      t.text :category_type

      t.timestamps
    end
  end
end
