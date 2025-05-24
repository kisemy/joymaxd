class CreateInternalSupplies < ActiveRecord::Migration[6.0]
  def change
    create_table :internal_supplies do |t|
      t.text :supplier_name

      t.timestamps
    end
  end
end
