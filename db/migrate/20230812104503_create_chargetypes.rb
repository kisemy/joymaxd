class CreateChargetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :chargetypes do |t|
      t.text :code
      t.text :charge_description

      t.timestamps
    end
  end
end
