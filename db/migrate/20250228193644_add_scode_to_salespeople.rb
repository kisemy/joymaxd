class AddScodeToSalespeople < ActiveRecord::Migration[6.0]
   def change
    add_column :salespeople, :scode, :string

    # Make `scode` the primary key
    remove_column :salespeople, :id
    rename_column :salespeople, :scode, :id
    execute "ALTER TABLE salespeople ADD PRIMARY KEY (id);"

    # Add a unique index to ensure uniqueness
    add_index :salespeople, :id, unique: true
  end
end
