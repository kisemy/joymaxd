class DashboardsController < ApplicationController


def index
    grouped_data = ChartOfAccount.group(:accounttype)
                                 .select('accounttype, SUM(balance) as total_balance')

    @chart_data = grouped_data.each_with_object({}) do |entry, result|
      if entry.accounttype.downcase.include?('income')
        result['Income'] ||= 0
        result['Income'] += entry.total_balance.to_f
      elsif entry.accounttype.downcase.include?('balance sheet')
        result['Balance Sheet'] ||= 0
        result['Balance Sheet'] += entry.total_balance.to_f
      end
    end

    render :index
  end
    




 def account_charts1
    # Fetch data grouped by accounttype
    @account_data = ChartOfAccount.group(:accounttype).count
    # Example result: { "Assets" => 10, "Liabilities" => 8, "Income" => 5 }
  end
  
   def account_balances
   
   
   ChartOfAccount.all
ChartOfAccount.group(:account_category).sum(:balance)

  @balances_by_category = ChartOfAccount.group(:account_category).sum(:balance) || {}
 

  end
  
  def account_charts
   @account_data = ChartOfAccount.group(:account_category).sum(:balance)
    # Add a fallback to ensure it's never nil
    @account_data ||= {}
  
  
    # Group and sum balances for income and balance sheet categories
    @income_categories = ChartOfAccount.where(accounttype: 'Income')
                                       .group(:account_category)
                                       .sum(:balance)

    @balance_sheet_categories = ChartOfAccount.where(accounttype: 'Balance Sheet')
                                              .group(:account_category)
                                              .sum(:balance)
                                              
                                              
                                              
                                              
                                           
           grouped_data = ChartOfAccount.group(:accounttype)
                                 .select('accounttype, SUM(balance) as total_balance')

    @chart_data = grouped_data.each_with_object({}) do |entry, result|
      if entry.accounttype.downcase.include?('income')
        result['Income'] ||= 0
        result['Income'] += entry.total_balance.to_f
      elsif entry.accounttype.downcase.include?('balance sheet')
        result['Balance Sheet'] ||= 0
        result['Balance Sheet'] += entry.total_balance.to_f
      end
    end
    
    
    
     @expense_data = ChartOfAccount
      .where(account_category: 'expense')
      .group(:name)
      .sum(:balance)





    # Format data for the chart
    @pie_chart_data = @expense_data.map { |category, total| { name: category, y: total.to_f } }
                                              
                                              
                                              
                                              
                                              
                                              
                                              
  end 
  
  
  
  
  
  
  
  



  
  def dashboard_1
 
   def index
    grouped_data = ChartOfAccount.group(:accounttype)
                                 .select('accounttype, SUM(balance) as total_balance')

    @chart_data = grouped_data.each_with_object({}) do |entry, result|
      if entry.accounttype.downcase.include?('income')
        result['Income'] ||= 0
        result['Income'] += entry.total_balance.to_f
      elsif entry.accounttype.downcase.include?('balance sheet')
        result['Balance Sheet'] ||= 0
        result['Balance Sheet'] += entry.total_balance.to_f
      end
    end

    render :index
  end
   
  end

  def dashboard_2
  end

  def dashboard_3
    @extra_class = "sidebar-content"
  end

  def dashboard_4
    render :layout => "layout_2"
  end

  def dashboard_4_1
  end

  def dashboard_5
  
  
  
  
  end

end
