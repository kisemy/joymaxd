class Gledger < ApplicationRecord
#validates :accountno, :description, :sourceno, :amount, presence: true
 belongs_to :payment, optional: true
  belongs_to :paymentline, optional: true
#belongs_to :chart_of_account, foreign_key: 'accountno', primary_key: 'no'  
  
belongs_to :chart_of_account, foreign_key: 'accountno', primary_key: 'no', optional: true


after_save :update_chart_of_account_totals
  after_destroy :update_chart_of_account_totals

  private

  def update_chart_of_account_totals
    chart_of_account&.update_totals!
  end



end
