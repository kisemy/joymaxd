require "application_system_test_case"

class ReceiptLinesTest < ApplicationSystemTestCase
  setup do
    @receipt_line = receipt_lines(:one)
  end

  test "visiting the index" do
    visit receipt_lines_url
    assert_selector "h1", text: "Receipt Lines"
  end

  test "creating a Receipt line" do
    visit receipt_lines_url
    click_on "New Receipt Line"

    fill_in "Account name", with: @receipt_line.account_name
    fill_in "Account no", with: @receipt_line.account_no
    fill_in "Account type", with: @receipt_line.account_type
    fill_in "Amount", with: @receipt_line.amount
    fill_in "Invoiceno", with: @receipt_line.invoiceno
    fill_in "Receipt account", with: @receipt_line.receipt_account
    fill_in "Receipt date", with: @receipt_line.receipt_date
    fill_in "Receipt", with: @receipt_line.receipt_id
    click_on "Create Receipt line"

    assert_text "Receipt line was successfully created"
    click_on "Back"
  end

  test "updating a Receipt line" do
    visit receipt_lines_url
    click_on "Edit", match: :first

    fill_in "Account name", with: @receipt_line.account_name
    fill_in "Account no", with: @receipt_line.account_no
    fill_in "Account type", with: @receipt_line.account_type
    fill_in "Amount", with: @receipt_line.amount
    fill_in "Invoiceno", with: @receipt_line.invoiceno
    fill_in "Receipt account", with: @receipt_line.receipt_account
    fill_in "Receipt date", with: @receipt_line.receipt_date
    fill_in "Receipt", with: @receipt_line.receipt_id
    click_on "Update Receipt line"

    assert_text "Receipt line was successfully updated"
    click_on "Back"
  end

  test "destroying a Receipt line" do
    visit receipt_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Receipt line was successfully destroyed"
  end
end
