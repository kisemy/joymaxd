class ChangeNoTypeInChartOfAccounts < ActiveRecord::Migration[6.0]
  def change
    change_column :chart_of_accounts, :no, :text
  end
end
