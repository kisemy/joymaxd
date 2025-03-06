class Paymentline < ApplicationRecord
  belongs_to :payment
 
  belongs_to :customer, optional: true
  belongs_to :vendor, optional: true
  belongs_to :bank, optional: true
  belongs_to :acchart, optional: true
  belongs_to :chart_of_account, optional: true

 has_many :account_types
 

   def accountno
    case account_type
    when 'customer'
      customer.try(:account_number) # Assuming 'account_number' is a field in the Customer model
    when 'bank'
      bank.try(:account_number) # Assuming 'account_number' is a field in the Bank model
    when 'g/l account'
      chart_of_account.try(:name) # Assuming 'name' is the field in the ChartOfAccount model
    else
      nil
    end
  end
 
 
 
 
  
  
  
end
