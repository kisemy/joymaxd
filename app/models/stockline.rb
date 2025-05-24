class Stockline < ApplicationRecord
  #belongs_to :stockin_headers
   #belongs_to :stockin_header, foreign_key: :stockin_header_stk_no, primary_key: :stk_no
  belongs_to :stockin_header, foreign_key: 'stk_no'
  
end
