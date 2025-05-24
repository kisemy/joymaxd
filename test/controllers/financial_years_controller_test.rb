require 'test_helper'

class FinancialYearsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @financial_year = financial_years(:one)
  end

  test "should get index" do
    get financial_years_url
    assert_response :success
  end

  test "should get new" do
    get new_financial_year_url
    assert_response :success
  end

  test "should create financial_year" do
    assert_difference('FinancialYear.count') do
      post financial_years_url, params: { financial_year: { code: @financial_year.code, description: @financial_year.description } }
    end

    assert_redirected_to financial_year_url(FinancialYear.last)
  end

  test "should show financial_year" do
    get financial_year_url(@financial_year)
    assert_response :success
  end

  test "should get edit" do
    get edit_financial_year_url(@financial_year)
    assert_response :success
  end

  test "should update financial_year" do
    patch financial_year_url(@financial_year), params: { financial_year: { code: @financial_year.code, description: @financial_year.description } }
    assert_redirected_to financial_year_url(@financial_year)
  end

  test "should destroy financial_year" do
    assert_difference('FinancialYear.count', -1) do
      delete financial_year_url(@financial_year)
    end

    assert_redirected_to financial_years_url
  end
end
