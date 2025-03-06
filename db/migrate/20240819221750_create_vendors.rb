class CreateVendors < ActiveRecord::Migration[6.0]
  def change
    create_table :vendors do |t|
      t.text :description
      t.text :contactname
      t.text :location
      t.references :payment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
