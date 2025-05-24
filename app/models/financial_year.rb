class FinancialYear < ApplicationRecord
  self.primary_key = "code"
   has_many :projects
end
