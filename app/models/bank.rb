class Bank < ApplicationRecord
 

  
# self.primary_key = 'bank_name'

  belongs_to :bankgroup, foreign_key: 'posting_group', primary_key: 'code', optional: true

  
   has_many :receipts

 self.primary_key = 'bank_name'
  has_many :receipt_lines, foreign_key: :bank_name, primary_key: :bank_name  
  
  
 
  
  
  
  

end
