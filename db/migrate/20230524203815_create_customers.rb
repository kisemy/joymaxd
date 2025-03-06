class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.text :customer_name
      t.text :contactno
      t.text :contact_name
      t.text :address
      t.text :city
      t.date :date
      t.text :sales_person_code
      t.text :sales_person_name

      t.timestamps
    end
  end
end
