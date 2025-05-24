class Village < ApplicationRecord

self.primary_key = 'village_code'
  
  # If you have these models (recommended)
  belongs_to :sub_county, foreign_key: 'sub_county_code', primary_key: 'sub_county_code'
  belongs_to :ward, foreign_key: 'ward_code', primary_key: 'ward_code'
  
  # Add validations
  validates :village_code, presence: true, uniqueness: true
  validates :village_name, presence: true
  validates_format_of :village_admin_email, with: URI::MailTo::EMAIL_REGEXP, allow_blank: true

end
