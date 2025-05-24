class AnalyticsController < ApplicationController

 def dashboard
    # Eager load all associations
    @projects = Project.includes(:department, :sub_county, :ward, :financial_year).all
    
    # Grouping data with proper associations
    @by_department = @projects.group_by(&:department).transform_values(&:count)
    @by_financial_year = @projects.group_by(&:financial_year).transform_values(&:count)
    @by_sub_county = @projects.group_by(&:sub_county).transform_values(&:count)
    @by_ward = @projects.group_by(&:ward).transform_values(&:count)
    
    # Budget sums
    @budget_by_department = @projects.group_by(&:department).transform_values { |projs| projs.sum(&:budget) }
    
    # For debugging - check console
    Rails.logger.info "Department data: #{@by_department.inspect}"
  end

end
