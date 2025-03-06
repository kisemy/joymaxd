class AddGlaccountAndBankgroupToBank < ActiveRecord::Migration[6.0]
  def change
    add_column :banks, :glaccount, :string
    add_column :banks, :bankgroup, :string
  end
end
