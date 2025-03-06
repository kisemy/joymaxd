class SalesOrder < ApplicationRecord
 self.primary_key = 'order_no'
belongs_to :customer, foreign_key: 'customer_no', primary_key: 'clientcode'
  before_create :generate_order_no

  private

  def generate_order_no
    last_order = SalesOrder.order(:order_no).last
    if last_order.nil?
      self.order_no = 'SO/01'
    else
      last_number = last_order.order_no.split('/').last.to_i
      self.order_no = "SO/#{(last_number + 1).to_s.rjust(2, '0')}"
    end
  end

end
