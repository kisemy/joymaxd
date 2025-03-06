require "application_system_test_case"

class ChartOfAccountsTest < ApplicationSystemTestCase
  setup do
    @chart_of_account = chart_of_accounts(:one)
  end

  test "visiting the index" do
    visit chart_of_accounts_url
    assert_selector "h1", text: "Chart Of Accounts"
  end

  test "creating a Chart of account" do
    visit chart_of_accounts_url
    click_on "New Chart Of Account"

    fill_in "Account category", with: @chart_of_account.account_category
    fill_in "Accounttype", with: @chart_of_account.accounttype
    fill_in "Balance", with: @chart_of_account.balance
    fill_in "Credit", with: @chart_of_account.credit
    fill_in "Debit", with: @chart_of_account.debit
    fill_in "Name", with: @chart_of_account.name
    fill_in "No", with: @chart_of_account.no
    click_on "Create Chart of account"

    assert_text "Chart of account was successfully created"
    click_on "Back"
  end

  test "updating a Chart of account" do
    visit chart_of_accounts_url
    click_on "Edit", match: :first

    fill_in "Account category", with: @chart_of_account.account_category
    fill_in "Accounttype", with: @chart_of_account.accounttype
    fill_in "Balance", with: @chart_of_account.balance
    fill_in "Credit", with: @chart_of_account.credit
    fill_in "Debit", with: @chart_of_account.debit
    fill_in "Name", with: @chart_of_account.name
    fill_in "No", with: @chart_of_account.no
    click_on "Update Chart of account"

    assert_text "Chart of account was successfully updated"
    click_on "Back"
  end

  test "destroying a Chart of account" do
    visit chart_of_accounts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chart of account was successfully destroyed"
  end
end
