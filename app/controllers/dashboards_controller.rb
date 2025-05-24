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
                                   
    # Get counts for all entities
    @projects_count = Project.count
    @projects_count = Project.count
    @sub_counties_count = SubCounty.count
    @wards_count = Ward.count
    @villages_count = Village.count
    @departments_count = Department.count
    @sections_count = Section.count
    @sub_sections_count = SubSection.count                                            
                                              
                                              
                                              
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
