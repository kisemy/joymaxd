require 'test_helper'

class StockoutHeadersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stockout_header = stockout_headers(:one)
  end

  test "should get index" do
    get stockout_headers_url
    assert_response :success
  end

  test "should get new" do
    get new_stockout_header_url
    assert_response :success
  end

  test "should create stockout_header" do
    assert_difference('StockoutHeader.count') do
      post stockout_headers_url, params: { stockout_header: { address: @stockout_header.address, client_category: @stockout_header.client_category, client_code: @stockout_header.client_code, client_name: @stockout_header.client_name, email: @stockout_header.email, issued: @stockout_header.issued, release_date: @stockout_header.release_date, request_date: @stockout_header.request_date, request_no: @stockout_header.request_no, requested_by: @stockout_header.requested_by, status: @stockout_header.status, stko: @stockout_header.stko, telephone: @stockout_header.telephone, warehouse_code: @stockout_header.warehouse_code, warehouse_name: @stockout_header.warehouse_name } }
    end

    assert_redirected_to stockout_header_url(StockoutHeader.last)
  end

  test "should show stockout_header" do
    get stockout_header_url(@stockout_header)
    assert_response :success
  end

  test "should get edit" do
    get edit_stockout_header_url(@stockout_header)
    assert_response :success
  end

  test "should update stockout_header" do
    patch stockout_header_url(@stockout_header), params: { stockout_header: { address: @stockout_header.address, client_category: @stockout_header.client_category, client_code: @stockout_header.client_code, client_name: @stockout_header.client_name, email: @stockout_header.email, issued: @stockout_header.issued, release_date: @stockout_header.release_date, request_date: @stockout_header.request_date, request_no: @stockout_header.request_no, requested_by: @stockout_header.requested_by, status: @stockout_header.status, stko: @stockout_header.stko, telephone: @stockout_header.telephone, warehouse_code: @stockout_header.warehouse_code, warehouse_name: @stockout_header.warehouse_name } }
    assert_redirected_to stockout_header_url(@stockout_header)
  end

  test "should destroy stockout_header" do
    assert_difference('StockoutHeader.count', -1) do
      delete stockout_header_url(@stockout_header)
    end

    assert_redirected_to stockout_headers_url
  end
end
