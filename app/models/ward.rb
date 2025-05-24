class Ward < ApplicationRecord

  self.primary_key = 'ward_code' # or whatever your primary key column is named
  #has_many :projects, foreign_key: 'ward_code'
# app/models/ward.rb
has_many :projects, foreign_key: 'ward_code', primary_key: 'ward_code'


end
