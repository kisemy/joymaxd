class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.text :default_description
      t.text :default_price

      t.timestamps
    end
  end
end
