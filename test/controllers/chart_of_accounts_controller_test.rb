require 'test_helper'

class ChartOfAccountsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @chart_of_account = chart_of_accounts(:one)
  end

  test "should get index" do
    get chart_of_accounts_url
    assert_response :success
  end

  test "should get new" do
    get new_chart_of_account_url
    assert_response :success
  end

  test "should create chart_of_account" do
    assert_difference('ChartOfAccount.count') do
      post chart_of_accounts_url, params: { chart_of_account: { account_category: @chart_of_account.account_category, accounttype: @chart_of_account.accounttype, balance: @chart_of_account.balance, credit: @chart_of_account.credit, debit: @chart_of_account.debit, name: @chart_of_account.name, no: @chart_of_account.no } }
    end

    assert_redirected_to chart_of_account_url(ChartOfAccount.last)
  end

  test "should show chart_of_account" do
    get chart_of_account_url(@chart_of_account)
    assert_response :success
  end

  test "should get edit" do
    get edit_chart_of_account_url(@chart_of_account)
    assert_response :success
  end

  test "should update chart_of_account" do
    patch chart_of_account_url(@chart_of_account), params: { chart_of_account: { account_category: @chart_of_account.account_category, accounttype: @chart_of_account.accounttype, balance: @chart_of_account.balance, credit: @chart_of_account.credit, debit: @chart_of_account.debit, name: @chart_of_account.name, no: @chart_of_account.no } }
    assert_redirected_to chart_of_account_url(@chart_of_account)
  end

  test "should destroy chart_of_account" do
    assert_difference('ChartOfAccount.count', -1) do
      delete chart_of_account_url(@chart_of_account)
    end

    assert_redirected_to chart_of_accounts_url
  end
end
