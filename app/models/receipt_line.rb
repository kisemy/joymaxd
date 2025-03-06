class ReceiptLine < ApplicationRecord
    belongs_to :receipt
  #belongs_to :account_type
   #belongs_to :customer, optional: true
 # belongs_to :bank, optional: true
#  belongs_to :chart_of_account, optional: true

 validates :account_type, inclusion: { in: %w[bank customer g/l_account] }

belongs_to :bank, foreign_key: :bank_name, primary_key: :bank_name, optional: true
  belongs_to :customer, foreign_key: :customer_name, primary_key: :customer_name, optional: true
  belongs_to :chart_of_account, foreign_key: :chart_of_account_name, primary_key: :name, optional: true

  # Rename the function to avoid conflicts
     @banks = Bank.pluck(:bank_name, :id) # [ ["Bank1", 1], ["Bank2", 2], ...]
    @customers = Customer.pluck(:customer_name, :id)
    @gl_accounts = ChartOfAccount.pluck(:name, :name)








  
end
