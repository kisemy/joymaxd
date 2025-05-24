class FixStocklinesForeignKey < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :stocklines, :stockin_headers if foreign_key_exists?(:stocklines, :stockin_headers)
    add_foreign_key :stocklines, :stockin_headers, column: :stk_no, primary_key: :stk_no
  end
end
