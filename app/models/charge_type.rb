class ChargeType < ApplicationRecord
belongs_to :invoice_line, primary_key: 'id'

end
