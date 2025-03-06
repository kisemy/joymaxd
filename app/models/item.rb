class Item < ApplicationRecord
 has_many :invoice_lines, foreign_key: 'item_no', primary_key: 'id'

end
