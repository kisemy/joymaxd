class Receipt < ApplicationRecord
has_many :receipt_lines, dependent: :destroy

#accepts_nested_attributes_for :invoice_lines

 accepts_nested_attributes_for :receipt_lines, allow_destroy: true 
  
  has_many :receipt_lines, dependent: :destroy
  accepts_nested_attributes_for :receipt_lines, allow_destroy: true 
   #belongs_to :bank, foreign_key: :bank_name, primary_key: :bank_name
    belongs_to :bank, foreign_key: :bank_code, primary_key: :bank_name
  
   def account_identifier
    case account_type
    when 'bank'
      bank&.bank_name
    when 'customer'
      customer&.customer_name
    when 'chart_of_account'
      chart_of_account&.name
    else
      nil
    end
  end


  
  
end
