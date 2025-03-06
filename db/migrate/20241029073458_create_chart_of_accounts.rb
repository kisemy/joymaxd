class CreateChartOfAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :chart_of_accounts, id: false do |t|
      t.integer :no, primary_key: true, null: false # Custom primary key
      t.text :name
      t.text :accounttype
      t.text :account_category
      t.decimal :debit, precision: 15, scale: 2
      t.decimal :credit, precision: 15, scale: 2
      t.decimal :balance, precision: 15, scale: 2

      t.timestamps
    end
  end
end



