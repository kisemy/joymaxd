module ChartOfAccountsHelper

  def color_class_for_account_type(account_type)
    case account_type.downcase
    when 'heading'
      'account-type-heading'
    when 'sub-heading'
      'account-type-sub-heading'
    when 'posting'
      'account-type-posting'
    when 'sub-total'
      'account-type-sub-total'
    when 'total'
      'account-type-total'
    else
      '' # No class if account type doesn't match
    end
  end




end
