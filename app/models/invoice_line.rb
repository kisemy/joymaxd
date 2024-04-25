class InvoiceLine < ApplicationRecord
  belongs_to :invoice, optional: true
  belongs_to :chargetype, optional: true
  belongs_to :product, optional: true
end

