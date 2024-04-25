require 'test_helper'

class ReceiptsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @receipt = receipts(:one)
  end

  test "should get index" do
    get receipts_url
    assert_response :success
  end

  test "should get new" do
    get new_receipt_url
    assert_response :success
  end

  test "should create receipt" do
    assert_difference('Receipt.count') do
      post receipts_url, params: { receipt: { account_type: @receipt.account_type, accountno: @receipt.accountno, amount: @receipt.amount, bank_code: @receipt.bank_code, description: @receipt.description, document_no: @receipt.document_no, receipt_by: @receipt.receipt_by, receipt_date: @receipt.receipt_date, receipt_description: @receipt.receipt_description, receipt_mode: @receipt.receipt_mode, received_by: @receipt.received_by, received_from: @receipt.received_from, status: @receipt.status } }
    end

    assert_redirected_to receipt_url(Receipt.last)
  end

  test "should show receipt" do
    get receipt_url(@receipt)
    assert_response :success
  end

  test "should get edit" do
    get edit_receipt_url(@receipt)
    assert_response :success
  end

  test "should update receipt" do
    patch receipt_url(@receipt), params: { receipt: { account_type: @receipt.account_type, accountno: @receipt.accountno, amount: @receipt.amount, bank_code: @receipt.bank_code, description: @receipt.description, document_no: @receipt.document_no, receipt_by: @receipt.receipt_by, receipt_date: @receipt.receipt_date, receipt_description: @receipt.receipt_description, receipt_mode: @receipt.receipt_mode, received_by: @receipt.received_by, received_from: @receipt.received_from, status: @receipt.status } }
    assert_redirected_to receipt_url(@receipt)
  end

  test "should destroy receipt" do
    assert_difference('Receipt.count', -1) do
      delete receipt_url(@receipt)
    end

    assert_redirected_to receipts_url
  end
end
