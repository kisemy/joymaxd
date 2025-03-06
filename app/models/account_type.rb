class AccountType < ApplicationRecord
 belongs_to :paymentline
 has_many :receipt_lines
end
