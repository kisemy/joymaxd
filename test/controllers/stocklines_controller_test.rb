require 'test_helper'

class StocklinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @stockline = stocklines(:one)
  end

  test "should get index" do
    get stocklines_url
    assert_response :success
  end

  test "should get new" do
    get new_stockline_url
    assert_response :success
  end

  test "should create stockline" do
    assert_difference('Stockline.count') do
      post stocklines_url, params: { stockline: { amount: @stockline.amount, batch_no: @stockline.batch_no, code: @stockline.code, comment: @stockline.comment, date: @stockline.date, expiry_date: @stockline.expiry_date, product_category: @stockline.product_category, product_description: @stockline.product_description, quality_check: @stockline.quality_check, quantity: @stockline.quantity, quantity_expected: @stockline.quantity_expected, received: @stockline.received, ref_no: @stockline.ref_no, stockin_headers_id: @stockline.stockin_headers_id, unit_cost: @stockline.unit_cost, unit_of_measure: @stockline.unit_of_measure, unit_price: @stockline.unit_price, warehouse_code: @stockline.warehouse_code, warehouse_name: @stockline.warehouse_name } }
    end

    assert_redirected_to stockline_url(Stockline.last)
  end

  test "should show stockline" do
    get stockline_url(@stockline)
    assert_response :success
  end

  test "should get edit" do
    get edit_stockline_url(@stockline)
    assert_response :success
  end

  test "should update stockline" do
    patch stockline_url(@stockline), params: { stockline: { amount: @stockline.amount, batch_no: @stockline.batch_no, code: @stockline.code, comment: @stockline.comment, date: @stockline.date, expiry_date: @stockline.expiry_date, product_category: @stockline.product_category, product_description: @stockline.product_description, quality_check: @stockline.quality_check, quantity: @stockline.quantity, quantity_expected: @stockline.quantity_expected, received: @stockline.received, ref_no: @stockline.ref_no, stockin_headers_id: @stockline.stockin_headers_id, unit_cost: @stockline.unit_cost, unit_of_measure: @stockline.unit_of_measure, unit_price: @stockline.unit_price, warehouse_code: @stockline.warehouse_code, warehouse_name: @stockline.warehouse_name } }
    assert_redirected_to stockline_url(@stockline)
  end

  test "should destroy stockline" do
    assert_difference('Stockline.count', -1) do
      delete stockline_url(@stockline)
    end

    assert_redirected_to stocklines_url
  end
end
