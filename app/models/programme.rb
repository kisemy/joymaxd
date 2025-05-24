class Programme < ApplicationRecord
  self.primary_key = 'programme_code' # Set custom primary key
  
  # Add validations
  validates :programme_code, presence: true, uniqueness: true
  validates :programme_name, presence: true
  has_many :projects, foreign_key: 'programme_code', primary_key: 'programme_code'
  
  
  
  
end

