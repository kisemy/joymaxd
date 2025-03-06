require 'test_helper'

class SalesQuotesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @sales_quote = sales_quotes(:one)
  end

  test "should get index" do
    get sales_quotes_url
    assert_response :success
  end

  test "should get new" do
    get new_sales_quote_url
    assert_response :success
  end

  test "should create sales_quote" do
    assert_difference('SalesQuote.count') do
      post sales_quotes_url, params: { sales_quote: { QTN_no: @sales_quote.QTN_no, address: @sales_quote.address, city: @sales_quote.city, contact_name: @sales_quote.contact_name, contactno: @sales_quote.contactno, customer_name: @sales_quote.customer_name, customer_no: @sales_quote.customer_no, quote_date: @sales_quote.quote_date, sales_person_code: @sales_quote.sales_person_code, sales_person_name: @sales_quote.sales_person_name } }
    end

    assert_redirected_to sales_quote_url(SalesQuote.last)
  end

  test "should show sales_quote" do
    get sales_quote_url(@sales_quote)
    assert_response :success
  end

  test "should get edit" do
    get edit_sales_quote_url(@sales_quote)
    assert_response :success
  end

  test "should update sales_quote" do
    patch sales_quote_url(@sales_quote), params: { sales_quote: { QTN_no: @sales_quote.QTN_no, address: @sales_quote.address, city: @sales_quote.city, contact_name: @sales_quote.contact_name, contactno: @sales_quote.contactno, customer_name: @sales_quote.customer_name, customer_no: @sales_quote.customer_no, quote_date: @sales_quote.quote_date, sales_person_code: @sales_quote.sales_person_code, sales_person_name: @sales_quote.sales_person_name } }
    assert_redirected_to sales_quote_url(@sales_quote)
  end

  test "should destroy sales_quote" do
    assert_difference('SalesQuote.count', -1) do
      delete sales_quote_url(@sales_quote)
    end

    assert_redirected_to sales_quotes_url
  end
end
