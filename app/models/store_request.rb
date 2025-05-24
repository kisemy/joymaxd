class StoreRequest < ApplicationRecord
   enum destination_type: { internal: 'internal', customer: 'customer' }
   
  belongs_to :internal_request, optional: true
  belongs_to :customer, optional: true
  
   has_many :store_requestlines
  accepts_nested_attributes_for :store_requestlines, allow_destroy: true
  
  
  
  
  
  #before_save :set_destination_details
  
  #private
  
  #def set_destination_details
   # if destination_type == "internal" && internal_request
      #self.destination_code = internal_request.code
      #self.destination_name = internal_request.name
    #elsif destination_type == "customer" && customer
      #self.destination_code = customer.s_no
     # self.destination_name = customer.supplier_name
   # end
  #end
  

  
  attr_accessor :internal_supply_id, :customer_clientcode
  
  # This will run before the record is saved (both create and update)
  before_save :set_destination_details
  
  # Add any validations you need
  validates :destination_type, presence: true
  # Add other validations as needed...
  
  private  # Everything below this is private to the class
  
  def set_destination_details
    case destination_type
    when 'internal'
      if internal_supply_id.present?
        supply = InternalSupply.find_by(id: internal_supply_id)
        if supply
          self.destination_code = supply.id.to_s
          self.destination_name = supply.supplier_name
        else
          errors.add(:base, "Selected internal supply not found")
        end
      end
    when 'customer'
      if customer_clientcode.present?
        customer = Customer.find_by(clientcode: customer_clientcode)
        if customer
          self.destination_code = customer.clientcode
          self.destination_name = customer.customer_name
        else
          errors.add(:base, "Selected customer not found")
        end
      end
    end
  end
  
  
  
  
  
  
  
   
   
   
end
