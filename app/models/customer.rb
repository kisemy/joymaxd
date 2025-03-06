class Customer < ApplicationRecord
#belongs_to :payment
  #has_many :receipt_lines
 #self.primary_key = 'customer_name'
  has_many :receipt_lines, foreign_key: :customer_name, primary_key: :clientcode  
  has_many :invoices, foreign_key: :customer_no, primary_key: :clientcode
  before_create :generate_clientcode
  
   has_many :sales_quotes
   has_many :sales_orders
   

  belongs_to :salesperson, optional: true



  private

  def generate_clientcode
    # Generate a unique alphanumeric code (e.g., "CUST001")
    last_code = Customer.order(:clientcode).last&.clientcode || "CUST000"
    number = last_code.match(/\d+/).to_s.to_i + 1
    self.clientcode = "CUST#{number.to_s.rjust(3, '0')}"
  end

  
end

