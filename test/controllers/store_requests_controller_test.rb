require 'test_helper'

class StoreRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_request = store_requests(:one)
  end

  test "should get index" do
    get store_requests_url
    assert_response :success
  end

  test "should get new" do
    get new_store_request_url
    assert_response :success
  end

  test "should create store_request" do
    assert_difference('StoreRequest.count') do
      post store_requests_url, params: { store_request: { Warehouse_name: @store_request.Warehouse_name, delivery_place: @store_request.delivery_place, destination_code: @store_request.destination_code, destination_name: @store_request.destination_name, invoice_no: @store_request.invoice_no, request_date: @store_request.request_date, request_status: @store_request.request_status, requsted_by: @store_request.requsted_by, status: @store_request.status, warehouse_code: @store_request.warehouse_code } }
    end

    assert_redirected_to store_request_url(StoreRequest.last)
  end

  test "should show store_request" do
    get store_request_url(@store_request)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_request_url(@store_request)
    assert_response :success
  end

  test "should update store_request" do
    patch store_request_url(@store_request), params: { store_request: { Warehouse_name: @store_request.Warehouse_name, delivery_place: @store_request.delivery_place, destination_code: @store_request.destination_code, destination_name: @store_request.destination_name, invoice_no: @store_request.invoice_no, request_date: @store_request.request_date, request_status: @store_request.request_status, requsted_by: @store_request.requsted_by, status: @store_request.status, warehouse_code: @store_request.warehouse_code } }
    assert_redirected_to store_request_url(@store_request)
  end

  test "should destroy store_request" do
    assert_difference('StoreRequest.count', -1) do
      delete store_request_url(@store_request)
    end

    assert_redirected_to store_requests_url
  end
end
