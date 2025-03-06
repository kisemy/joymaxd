class InvoiceLine < ApplicationRecord
  belongs_to :invoice, optional: true
  belongs_to :chargetype, optional: true
  belongs_to :product, optional: true
 # belongs_to :item, foreign_key: 'item_no', primary_key: 'id'
  
  
  
  
#belongs_to :item

 #before_validation :populate_fields_from_item, if: :item_id_changed?
  #private

  #def populate_fields_from_item
    #return unless item

   # self.description = item.description
   # self.units_of_measure = item.unit_of_measure
   # self.unit_price = item.unit_price
   # self.amount = self.quantity * self.unit_price
 # end  
  
  



  
  
  
  
  
  
  
  
end

