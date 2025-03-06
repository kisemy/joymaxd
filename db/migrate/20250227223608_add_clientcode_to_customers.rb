class AddClientcodeToCustomers < ActiveRecord::Migration[6.0]
  def up
    # Step 1: Add the `clientcode` column without the `NOT NULL` constraint
    add_column :customers, :clientcode, :string

    # Step 2: Populate `clientcode` for all existing records
    Customer.reset_column_information # Reload the model schema
    Customer.where(clientcode: nil).each_with_index do |customer, index|
      customer.update(clientcode: "CUST#{index + 1}")
    end

    # Step 3: Add the `NOT NULL` constraint
    change_column_null :customers, :clientcode, false

    # Step 4: Set `clientcode` as the primary key
    remove_column :customers, :id # Remove the default `id` column
    execute "ALTER TABLE customers ADD PRIMARY KEY (clientcode);" # Set `clientcode` as primary key
  end

  def down
    # Step 1: Add back the `id` column
    add_column :customers, :id, :primary_key

    # Step 2: Remove the primary key constraint from `clientcode`
    execute "ALTER TABLE customers DROP CONSTRAINT customers_pkey;"

    # Step 3: Remove the `clientcode` column
    remove_column :customers, :clientcode
  end
end
