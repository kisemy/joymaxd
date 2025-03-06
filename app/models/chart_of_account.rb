class ChartOfAccount < ApplicationRecord
 self.primary_key = 'no'
 
  has_many :gledgers, foreign_key: 'accountno', primary_key: 'no'
  
  has_many :bankgroups, 
           foreign_key: :code,   # the foreign key in bankgroup
           primary_key: :no  
 
#has_many :receipt_lines


# has_many :gledgers, primary_key: :no, foreign_key: :accountno

  # Calculate debit, credit, and balance dynamically
  
  
  
  def debit
    return 0 unless postable

    gledgers.where('amount > 0').sum(:amount)
  end

  def credit
    return 0 unless postable

    gledgers.where('amount < 0').sum(:amount).abs
  end

  def balance
    return 0 unless postable

    gledgers.sum(:amount)
  end
  
 
 def update_totals!
    if postable
      update(
        debit: gledgers.where('amount > 0').sum(:amount),
        credit: gledgers.where('amount < 0').sum(:amount).abs,
        balance: gledgers.sum(:amount)
      )
    else
      update(debit: 0, credit: 0, balance: 0)
    end
  end
  
  
    

  def total_debit
     #gledgers.sum(:amount)
     gledgers.where('amount > 0').sum('ROUND(amount, 2)')
  end

  def total_credit
    # Assuming credit transactions are negative amounts
    gledgers.where('amount < 0').sum(:amount).abs
  end

  def total_balance
    total_debit - total_credit
  end
  
 
 
 
 
 
 
end
