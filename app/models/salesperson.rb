class Salesperson < ApplicationRecord
 has_many :customers
 
 before_create :generate_scode

  private

  def generate_scode
    self.id = loop do
      random_code = SecureRandom.alphanumeric(10).upcase
      break random_code unless Salesperson.exists?(id: random_code)
    end
  end
 

end
