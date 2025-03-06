class AddPostedToReceipts < ActiveRecord::Migration[6.0]
  def change
    add_column :receipts, :posted, :boolean
  end
end
