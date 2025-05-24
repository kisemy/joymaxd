class StockissueLine < ApplicationRecord
  #belongs_to :stockout_header
  belongs_to :stockoutheader, foreign_key: 'stockoutheader_id'
end
