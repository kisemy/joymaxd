require 'test_helper'

class SalesorderLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salesorder_line = salesorder_lines(:one)
  end

  test "should get index" do
    get salesorder_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_salesorder_line_url
    assert_response :success
  end

  test "should create salesorder_line" do
    assert_difference('SalesorderLine.count') do
      post salesorder_lines_url, params: { salesorder_line: { amount: @salesorder_line.amount, charge_type: @salesorder_line.charge_type, description: @salesorder_line.description, item_no: @salesorder_line.item_no, quantity: @salesorder_line.quantity, unit_of_measure: @salesorder_line.unit_of_measure, unit_price: @salesorder_line.unit_price } }
    end

    assert_redirected_to salesorder_line_url(SalesorderLine.last)
  end

  test "should show salesorder_line" do
    get salesorder_line_url(@salesorder_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_salesorder_line_url(@salesorder_line)
    assert_response :success
  end

  test "should update salesorder_line" do
    patch salesorder_line_url(@salesorder_line), params: { salesorder_line: { amount: @salesorder_line.amount, charge_type: @salesorder_line.charge_type, description: @salesorder_line.description, item_no: @salesorder_line.item_no, quantity: @salesorder_line.quantity, unit_of_measure: @salesorder_line.unit_of_measure, unit_price: @salesorder_line.unit_price } }
    assert_redirected_to salesorder_line_url(@salesorder_line)
  end

  test "should destroy salesorder_line" do
    assert_difference('SalesorderLine.count', -1) do
      delete salesorder_line_url(@salesorder_line)
    end

    assert_redirected_to salesorder_lines_url
  end
end
