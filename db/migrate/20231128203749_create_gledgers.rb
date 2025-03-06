class CreateGledgers < ActiveRecord::Migration[6.0]
  def change
    create_table :gledgers do |t|
      t.text :accountno
      t.date :date
      t.text :documentno
      t.text :description
      t.decimal :amount
      t.text :sourcetype
      t.text :sourceno

      t.timestamps
    end
  end
end
