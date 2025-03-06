class SalesQuote < ApplicationRecord
self.primary_key = 'QTN_no'
 belongs_to :customer, foreign_key: 'customer_no', primary_key: 'clientcode'
  before_create :generate_qtn_no

  private

  def generate_qtn_no
    last_quote = SalesQuote.order(:QTN_no).last
    if last_quote.nil?
      self.QTN_no = 'QTN/01'
    else
      last_number = last_quote.QTN_no.split('/').last.to_i
      self.QTN_no = "QTN/#{(last_number + 1).to_s.rjust(2, '0')}"
    end
  end

end
