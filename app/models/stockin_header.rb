class StockinHeader < ApplicationRecord

self.primary_key = 'stk_no'
  

 has_many :stocklines, foreign_key: 'stk_no', dependent: :destroy
  accepts_nested_attributes_for :stocklines, allow_destroy: true
  
 #belongs_to :customer, foreign_key: 'customer_no', primary_key: 'clientcode'  
  
  belongs_to :supplier, foreign_key: :supplier_code, primary_key: :s_no

  #before_validation :populate_from_supplier, if: :supplier_code_changed? 
     

  
  # Make stk_no read-only after creation
  attr_readonly :stk_no
  
  

  
  #before_validation :ensure_stk_no, on: :create
  #validates :stk_no, presence: true, uniqueness: true
  
 # attr_readonly :stk_no
  
  # Public method to generate the number
  def generate_stk_no
    self.class.transaction do
      last_record = StockinHeader.order(:stk_no).lock(true).last
      last_num = last_record ? last_record.stk_no.gsub(/^STK/, '').to_i : 0
      self.stk_no = "STK#{sprintf('%02d', last_num + 1)}"
    end
  end
  
  private
  
  # Private method that will be called before validation
  #def ensure_stk_no
   # generate_stk_no if stk_no.blank?
  #end
 
 

  
  
  
  
end
