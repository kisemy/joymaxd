require "application_system_test_case"

class PaymentsTest < ApplicationSystemTestCase
  setup do
    @payment = payments(:one)
  end

  test "visiting the index" do
    visit payments_url
    assert_selector "h1", text: "Payments"
  end

  test "creating a Payment" do
    visit payments_url
    click_on "New Payment"

    fill_in "Account type", with: @payment.account_type
    fill_in "Amount", with: @payment.amount
    fill_in "Category type", with: @payment.category_type
    fill_in "Documentno", with: @payment.documentno
    fill_in "Mode of payment", with: @payment.mode_of_payment
    fill_in "Payee code", with: @payment.payee_code
    fill_in "Payee name", with: @payment.payee_name
    fill_in "Paying acc description", with: @payment.paying_acc_description
    fill_in "Paying account code", with: @payment.paying_account_code
    fill_in "Payment date", with: @payment.payment_date
    fill_in "Payment description", with: @payment.payment_description
    fill_in "Posted", with: @payment.posted
    fill_in "Prepared by", with: @payment.prepared_by
    fill_in "Release date", with: @payment.release_date
    fill_in "Status", with: @payment.status
    click_on "Create Payment"

    assert_text "Payment was successfully created"
    click_on "Back"
  end

  test "updating a Payment" do
    visit payments_url
    click_on "Edit", match: :first

    fill_in "Account type", with: @payment.account_type
    fill_in "Amount", with: @payment.amount
    fill_in "Category type", with: @payment.category_type
    fill_in "Documentno", with: @payment.documentno
    fill_in "Mode of payment", with: @payment.mode_of_payment
    fill_in "Payee code", with: @payment.payee_code
    fill_in "Payee name", with: @payment.payee_name
    fill_in "Paying acc description", with: @payment.paying_acc_description
    fill_in "Paying account code", with: @payment.paying_account_code
    fill_in "Payment date", with: @payment.payment_date
    fill_in "Payment description", with: @payment.payment_description
    fill_in "Posted", with: @payment.posted
    fill_in "Prepared by", with: @payment.prepared_by
    fill_in "Release date", with: @payment.release_date
    fill_in "Status", with: @payment.status
    click_on "Update Payment"

    assert_text "Payment was successfully updated"
    click_on "Back"
  end

  test "destroying a Payment" do
    visit payments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Payment was successfully destroyed"
  end
end
