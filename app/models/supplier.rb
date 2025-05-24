class Supplier < ApplicationRecord
 self.primary_key = 's_no'

  before_create :generate_s_no
  
   has_many :store_requests
  

  private

  def generate_s_no
    last_supplier = Supplier.order(:s_no).last
    if last_supplier.nil?
      self.s_no = 's_no/01'
    else
      last_number = last_supplier.s_no.split('/').last.to_i
      self.s_no = "s_no/#{(last_number + 1).to_s.rjust(2, '0')}"
    end
  end

end
