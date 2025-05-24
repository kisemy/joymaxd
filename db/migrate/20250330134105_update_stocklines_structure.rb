class UpdateStocklinesStructure < ActiveRecord::Migration[6.0]
  
  def change
    # Remove old column
    remove_column :stocklines, :stockin_header_id, :string

    # Add new column with index
    add_column :stocklines, :stk_no, :string, null: false
    add_index :stocklines, :stk_no

    # Add foreign key constraint
    add_foreign_key :stocklines, :stockin_headers, column: :stk_no, primary_key: :stk_no
  end

end
