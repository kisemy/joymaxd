require 'test_helper'

class SalesquoteLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @salesquote_line = salesquote_lines(:one)
  end

  test "should get index" do
    get salesquote_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_salesquote_line_url
    assert_response :success
  end

  test "should create salesquote_line" do
    assert_difference('SalesquoteLine.count') do
      post salesquote_lines_url, params: { salesquote_line: { amount: @salesquote_line.amount, charge_type: @salesquote_line.charge_type, description: @salesquote_line.description, item_no: @salesquote_line.item_no, quantity: @salesquote_line.quantity, unit_of_measure: @salesquote_line.unit_of_measure, unit_price: @salesquote_line.unit_price } }
    end

    assert_redirected_to salesquote_line_url(SalesquoteLine.last)
  end

  test "should show salesquote_line" do
    get salesquote_line_url(@salesquote_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_salesquote_line_url(@salesquote_line)
    assert_response :success
  end

  test "should update salesquote_line" do
    patch salesquote_line_url(@salesquote_line), params: { salesquote_line: { amount: @salesquote_line.amount, charge_type: @salesquote_line.charge_type, description: @salesquote_line.description, item_no: @salesquote_line.item_no, quantity: @salesquote_line.quantity, unit_of_measure: @salesquote_line.unit_of_measure, unit_price: @salesquote_line.unit_price } }
    assert_redirected_to salesquote_line_url(@salesquote_line)
  end

  test "should destroy salesquote_line" do
    assert_difference('SalesquoteLine.count', -1) do
      delete salesquote_line_url(@salesquote_line)
    end

    assert_redirected_to salesquote_lines_url
  end
end
