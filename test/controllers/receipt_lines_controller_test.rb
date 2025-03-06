require 'test_helper'

class ReceiptLinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receipt_line = receipt_lines(:one)
  end

  test "should get index" do
    get receipt_lines_url
    assert_response :success
  end

  test "should get new" do
    get new_receipt_line_url
    assert_response :success
  end

  test "should create receipt_line" do
    assert_difference('ReceiptLine.count') do
      post receipt_lines_url, params: { receipt_line: { account_name: @receipt_line.account_name, account_no: @receipt_line.account_no, account_type: @receipt_line.account_type, amount: @receipt_line.amount, invoiceno: @receipt_line.invoiceno, receipt_account: @receipt_line.receipt_account, receipt_date: @receipt_line.receipt_date, receipt_id: @receipt_line.receipt_id } }
    end

    assert_redirected_to receipt_line_url(ReceiptLine.last)
  end

  test "should show receipt_line" do
    get receipt_line_url(@receipt_line)
    assert_response :success
  end

  test "should get edit" do
    get edit_receipt_line_url(@receipt_line)
    assert_response :success
  end

  test "should update receipt_line" do
    patch receipt_line_url(@receipt_line), params: { receipt_line: { account_name: @receipt_line.account_name, account_no: @receipt_line.account_no, account_type: @receipt_line.account_type, amount: @receipt_line.amount, invoiceno: @receipt_line.invoiceno, receipt_account: @receipt_line.receipt_account, receipt_date: @receipt_line.receipt_date, receipt_id: @receipt_line.receipt_id } }
    assert_redirected_to receipt_line_url(@receipt_line)
  end

  test "should destroy receipt_line" do
    assert_difference('ReceiptLine.count', -1) do
      delete receipt_line_url(@receipt_line)
    end

    assert_redirected_to receipt_lines_url
  end
end
