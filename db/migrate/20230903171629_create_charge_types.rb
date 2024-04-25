class CreateChargeTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :charge_types do |t|
      t.text :description

      t.timestamps
    end
  end
end
