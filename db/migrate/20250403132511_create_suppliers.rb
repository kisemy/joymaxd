class CreateSuppliers < ActiveRecord::Migration[6.0]

    def change
    create_table :suppliers, id: false do |t|
      t.string :s_no, primary_key: true
      t.text :supplier_name
      t.text :address
      t.text :city
      t.string :contact
      t.string :telephone
      t.text :email
      t.string :posting_group

      t.timestamps
   
  end
  end
end
