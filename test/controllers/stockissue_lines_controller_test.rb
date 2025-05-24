require 'test_helper'

class StockissueLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stockissue_line = stockissue_lines(:one)
  end

  test "should get index" do
    get stockissue_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_stockissue_line_url
    assert_response :success
  end

  test "should create stockissue_line" do
    assert_difference('StockissueLine.count') do
      post stockissue_lines_url, params: { stockissue_line: { amount: @stockissue_line.amount, batch_no: @stockissue_line.batch_no, batch_quantity: @stockissue_line.batch_quantity, client_code: @stockissue_line.client_code, client_name: @stockissue_line.client_name, code: @stockissue_line.code, expired: @stockissue_line.expired, expiry_date: @stockissue_line.expiry_date, issued: @stockissue_line.issued, issued_quantity: @stockissue_line.issued_quantity, latest_expiry: @stockissue_line.latest_expiry, product_description: @stockissue_line.product_description, stock_balance: @stockissue_line.stock_balance, stockout_header_id: @stockissue_line.stockout_header_id, unit_cost: @stockissue_line.unit_cost } }
    end

    assert_redirected_to stockissue_line_url(StockissueLine.last)
  end

  test "should show stockissue_line" do
    get stockissue_line_url(@stockissue_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_stockissue_line_url(@stockissue_line)
    assert_response :success
  end

  test "should update stockissue_line" do
    patch stockissue_line_url(@stockissue_line), params: { stockissue_line: { amount: @stockissue_line.amount, batch_no: @stockissue_line.batch_no, batch_quantity: @stockissue_line.batch_quantity, client_code: @stockissue_line.client_code, client_name: @stockissue_line.client_name, code: @stockissue_line.code, expired: @stockissue_line.expired, expiry_date: @stockissue_line.expiry_date, issued: @stockissue_line.issued, issued_quantity: @stockissue_line.issued_quantity, latest_expiry: @stockissue_line.latest_expiry, product_description: @stockissue_line.product_description, stock_balance: @stockissue_line.stock_balance, stockout_header_id: @stockissue_line.stockout_header_id, unit_cost: @stockissue_line.unit_cost } }
    assert_redirected_to stockissue_line_url(@stockissue_line)
  end

  test "should destroy stockissue_line" do
    assert_difference('StockissueLine.count', -1) do
      delete stockissue_line_url(@stockissue_line)
    end

    assert_redirected_to stockissue_lines_url
  end
end
