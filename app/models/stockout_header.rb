class StockoutHeader < ApplicationRecord
 self.primary_key = 'stko'
  has_many :stockissue_lines, foreign_key: 'stockoutheader_id'
    
end
