class SalesquoteLine < ApplicationRecord

belongs_to :sales_quote, optional: true
end
