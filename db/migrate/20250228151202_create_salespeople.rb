class CreateSalespeople < ActiveRecord::Migration[6.0]
  def change
    create_table :salespeople do |t|
      t.text :name
      t.text :email
      t.text :phone_no
      t.text :job_title
      t.decimal :total_sales
      t.decimal :commission

      t.timestamps
    end
  end
end
