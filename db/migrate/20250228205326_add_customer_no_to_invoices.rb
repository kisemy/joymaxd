class AddCustomerNoToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :customer_no, :string
    add_index :invoices, :customer_no
  end
end
