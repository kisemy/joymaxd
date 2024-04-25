class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.text :description
      t.text :units_of_measure
      t.decimal :unit_cost
      t.text :unit_price
      t.decimal :inventory
      t.text :shelf_no
      t.text :item_category

      t.timestamps
    end
  end
end
