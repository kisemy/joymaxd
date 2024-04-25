class Payment < ApplicationRecord
has_many :paymentlines, dependent: :destroy

#accepts_nested_attributes_for :invoice_lines

  accepts_nested_attributes_for :paymentlines

end

