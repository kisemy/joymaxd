class Product < ApplicationRecord
has_many :invoice_lines
belongs_to :category, optional: true
end
