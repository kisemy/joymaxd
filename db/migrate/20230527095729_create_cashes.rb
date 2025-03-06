class CreateCashes < ActiveRecord::Migration[6.0]
  def change
    create_table :cashes do |t|
      t.text :cash_name
      t.text :posting_group
      t.decimal :balance

      t.timestamps
    end
  end
end
