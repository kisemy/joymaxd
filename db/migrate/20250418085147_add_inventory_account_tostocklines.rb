class AddInventoryAccountTostocklines < ActiveRecord::Migration[6.0]
  def change
  add_column :stocklines, :inventory_account, :string
  end
end
