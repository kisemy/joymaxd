class CreateWarehouses < ActiveRecord::Migration[6.0]
  def change
    create_table :warehouses do |t|
      t.text :warehouse_name

      t.timestamps
    end
  end
end
