class AddPostableToChartOfAccounts < ActiveRecord::Migration[6.0]
  def change
    add_column :chart_of_accounts, :postable, :boolean
  end
end
