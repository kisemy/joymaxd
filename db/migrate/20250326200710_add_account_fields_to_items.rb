class AddAccountFieldsToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :sales_account, :string
    add_column :items, :sales_acc_name, :string
    add_column :items, :cost_account, :string
    add_column :items, :cost_acc_name, :string
    add_column :items, :purchase_account, :string
    add_column :items, :purchase_acc_name, :string
  end
end
