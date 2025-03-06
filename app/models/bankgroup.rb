class Bankgroup < ApplicationRecord
 self.primary_key = 'code'
 #ChartOfAccount
 

 belongs_to :chart_of_account, 
             primary_key: :no,  # the primary key in chart_of_accounts
             foreign_key: :code, # the foreign key in bankgroup
             class_name: 'ChartOfAccount', 
             optional: true
             
             
             
   has_many :banks, foreign_key: 'posting_group', primary_key: 'code'         
             

end
