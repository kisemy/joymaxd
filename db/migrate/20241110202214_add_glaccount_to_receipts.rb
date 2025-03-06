class AddGlaccountToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :glaccount, :string
  end
end
