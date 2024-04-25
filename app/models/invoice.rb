class Invoice < ApplicationRecord
 
   
has_many :invoice_lines, dependent: :destroy

#accepts_nested_attributes_for :invoice_lines

  accepts_nested_attributes_for :invoice_lines

    #accepts_nested_attributes_for :invoice_lines
     #def invoice_lines_attributes=(hash)
	  #  if !!self.id
	     # self.invoice_lines.clear
	     # hash.values.each do |attributes|
		#attrs = attributes.merge({invoice_id: self.id})
		#self.invoice_lines << InvoiceLine.find_or_create_by(attrs)
	    #  end
	  # end
	 # end




#def invoice_lines_attributes=(hash)
#    if !!self.id
#      self.invoice_lines.clear
#      hash.values.each do |attributes|
#        attrs = attributes.merge({invoice_id: self.id})
#        self.invoice_lines << InvoiceLine.find_or_create_by(attrs)
 #     end
 #   end
  #end









def calculate_product_totals
    self.invoice_lines.each do |invoice_line|
      if invoice_line
        invoice_line.amount = invoice_line.unit_price * invoice_line.quantity
       #@subtotal = @subtotal + invoice_line.amount 
      end 
    end
    self.save
  end






end




