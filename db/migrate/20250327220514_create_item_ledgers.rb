class CreateItemLedgers < ActiveRecord::Migration[6.0]
  def change
    create_table :item_ledgers do |t|
      t.string :item_no
      t.date :posting_date
      t.string :document_no
      t.string :source_no
      t.text :description
      t.decimal :quantity

      t.timestamps
    end
  end
end
