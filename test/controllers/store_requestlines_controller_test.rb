require 'test_helper'

class StoreRequestlinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_requestline = store_requestlines(:one)
  end

  test "should get index" do
    get store_requestlines_url
    assert_response :success
  end

  test "should get new" do
    get new_store_requestline_url
    assert_response :success
  end

  test "should create store_requestline" do
    assert_difference('StoreRequestline.count') do
      post store_requestlines_url, params: { store_requestline: { amount: @store_requestline.amount, batch_no: @store_requestline.batch_no, code: @store_requestline.code, destination_code: @store_requestline.destination_code, destination_name: @store_requestline.destination_name, expiry_date: @store_requestline.expiry_date, product_description: @store_requestline.product_description, quantity: @store_requestline.quantity, received: @store_requestline.received, stock_balance: @store_requestline.stock_balance, store_request_id: @store_requestline.store_request_id, unit_cost: @store_requestline.unit_cost } }
    end

    assert_redirected_to store_requestline_url(StoreRequestline.last)
  end

  test "should show store_requestline" do
    get store_requestline_url(@store_requestline)
    assert_response :success
  end

  test "should get edit" do
    get edit_store_requestline_url(@store_requestline)
    assert_response :success
  end

  test "should update store_requestline" do
    patch store_requestline_url(@store_requestline), params: { store_requestline: { amount: @store_requestline.amount, batch_no: @store_requestline.batch_no, code: @store_requestline.code, destination_code: @store_requestline.destination_code, destination_name: @store_requestline.destination_name, expiry_date: @store_requestline.expiry_date, product_description: @store_requestline.product_description, quantity: @store_requestline.quantity, received: @store_requestline.received, stock_balance: @store_requestline.stock_balance, store_request_id: @store_requestline.store_request_id, unit_cost: @store_requestline.unit_cost } }
    assert_redirected_to store_requestline_url(@store_requestline)
  end

  test "should destroy store_requestline" do
    assert_difference('StoreRequestline.count', -1) do
      delete store_requestline_url(@store_requestline)
    end

    assert_redirected_to store_requestlines_url
  end
end
