class CreateSalesQuotes < ActiveRecord::Migration[6.0]
  def change
    create_table :sales_quotes, id: false do |t|
      t.string :QTN_no, primary_key: true
      t.string :customer_no
      t.string :customer_name
      t.string :contactno
      t.string :contact_name
      t.string :address
      t.string :city
      t.date :quote_date
      t.string :sales_person_code
      t.string :sales_person_name

      t.timestamps
    end
  end
end
