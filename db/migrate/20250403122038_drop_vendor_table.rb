class DropVendorTable < ActiveRecord::Migration[6.0]

  def up
    drop_table :vendors
  end

  def down
    create_table :vendors do |t|
      # Add all the original columns here
      # t.string :name
      # t.text :description
      # etc.
      
      t.timestamps
    end
  end
  

end
