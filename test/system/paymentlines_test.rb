require "application_system_test_case"

class PaymentlinesTest < ApplicationSystemTestCase
  setup do
    @paymentline = paymentlines(:one)
  end

  test "visiting the index" do
    visit paymentlines_url
    assert_selector "h1", text: "Paymentlines"
  end

  test "creating a Paymentline" do
    visit paymentlines_url
    click_on "New Paymentline"

    fill_in "Account type", with: @paymentline.account_type
    fill_in "Accountname", with: @paymentline.accountname
    fill_in "Accountno", with: @paymentline.accountno
    fill_in "Amount", with: @paymentline.amount
    fill_in "Description", with: @paymentline.description
    fill_in "Paying account", with: @paymentline.paying_account
    fill_in "Payment", with: @paymentline.payment_id
    click_on "Create Paymentline"

    assert_text "Paymentline was successfully created"
    click_on "Back"
  end

  test "updating a Paymentline" do
    visit paymentlines_url
    click_on "Edit", match: :first

    fill_in "Account type", with: @paymentline.account_type
    fill_in "Accountname", with: @paymentline.accountname
    fill_in "Accountno", with: @paymentline.accountno
    fill_in "Amount", with: @paymentline.amount
    fill_in "Description", with: @paymentline.description
    fill_in "Paying account", with: @paymentline.paying_account
    fill_in "Payment", with: @paymentline.payment_id
    click_on "Update Paymentline"

    assert_text "Paymentline was successfully updated"
    click_on "Back"
  end

  test "destroying a Paymentline" do
    visit paymentlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Paymentline was successfully destroyed"
  end
end
