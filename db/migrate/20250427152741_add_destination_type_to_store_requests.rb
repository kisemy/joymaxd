class AddDestinationTypeToStoreRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :store_requests, :destination_type, :string
    
    # Add a constraint to only allow 'internal' or 'customer' values
    reversible do |dir|
      dir.up do
        execute <<-SQL
          ALTER TABLE store_requests
          ADD CONSTRAINT check_destination_type
          CHECK (destination_type IN ('internal', 'customer'))
        SQL
      end
      dir.down do
        execute <<-SQL
          ALTER TABLE store_requests
          DROP CONSTRAINT IF EXISTS check_destination_type
        SQL
      end
    end
    
    # Add index if you'll be querying frequently by this column
    add_index :store_requests, :destination_type 
    
    
    
    
  end
end
