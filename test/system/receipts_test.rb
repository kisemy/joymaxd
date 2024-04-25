require "application_system_test_case"

class ReceiptsTest < ApplicationSystemTestCase
  setup do
    @receipt = receipts(:one)
  end

  test "visiting the index" do
    visit receipts_url
    assert_selector "h1", text: "Receipts"
  end

  test "creating a Receipt" do
    visit receipts_url
    click_on "New Receipt"

    fill_in "Account type", with: @receipt.account_type
    fill_in "Accountno", with: @receipt.accountno
    fill_in "Amount", with: @receipt.amount
    fill_in "Bank code", with: @receipt.bank_code
    fill_in "Description", with: @receipt.description
    fill_in "Document no", with: @receipt.document_no
    fill_in "Receipt by", with: @receipt.receipt_by
    fill_in "Receipt date", with: @receipt.receipt_date
    fill_in "Receipt description", with: @receipt.receipt_description
    fill_in "Receipt mode", with: @receipt.receipt_mode
    fill_in "Received by", with: @receipt.received_by
    fill_in "Received from", with: @receipt.received_from
    fill_in "Status", with: @receipt.status
    click_on "Create Receipt"

    assert_text "Receipt was successfully created"
    click_on "Back"
  end

  test "updating a Receipt" do
    visit receipts_url
    click_on "Edit", match: :first

    fill_in "Account type", with: @receipt.account_type
    fill_in "Accountno", with: @receipt.accountno
    fill_in "Amount", with: @receipt.amount
    fill_in "Bank code", with: @receipt.bank_code
    fill_in "Description", with: @receipt.description
    fill_in "Document no", with: @receipt.document_no
    fill_in "Receipt by", with: @receipt.receipt_by
    fill_in "Receipt date", with: @receipt.receipt_date
    fill_in "Receipt description", with: @receipt.receipt_description
    fill_in "Receipt mode", with: @receipt.receipt_mode
    fill_in "Received by", with: @receipt.received_by
    fill_in "Received from", with: @receipt.received_from
    fill_in "Status", with: @receipt.status
    click_on "Update Receipt"

    assert_text "Receipt was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt" do
    visit receipts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt was successfully destroyed"
  end
end
