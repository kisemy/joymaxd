class Payment < ApplicationRecord

 has_many :banks

#accepts_nested_attributes_for :invoice_lines


  
 has_many :paymentlines, dependent: :destroy

  accepts_nested_attributes_for :paymentlines, allow_destroy: true  
  
  

end

