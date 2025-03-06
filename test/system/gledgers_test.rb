require "application_system_test_case"

class GledgersTest < ApplicationSystemTestCase
  setup do
    @gledger = gledgers(:one)
  end

  test "visiting the index" do
    visit gledgers_url
    assert_selector "h1", text: "Gledgers"
  end

  test "creating a Gledger" do
    visit gledgers_url
    click_on "New Gledger"

    fill_in "Accountno", with: @gledger.accountno
    fill_in "Amount", with: @gledger.amount
    fill_in "Date", with: @gledger.date
    fill_in "Description", with: @gledger.description
    fill_in "Documentno", with: @gledger.documentno
    fill_in "Sourceno", with: @gledger.sourceno
    fill_in "Sourcetype", with: @gledger.sourcetype
    click_on "Create Gledger"

    assert_text "Gledger was successfully created"
    click_on "Back"
  end

  test "updating a Gledger" do
    visit gledgers_url
    click_on "Edit", match: :first

    fill_in "Accountno", with: @gledger.accountno
    fill_in "Amount", with: @gledger.amount
    fill_in "Date", with: @gledger.date
    fill_in "Description", with: @gledger.description
    fill_in "Documentno", with: @gledger.documentno
    fill_in "Sourceno", with: @gledger.sourceno
    fill_in "Sourcetype", with: @gledger.sourcetype
    click_on "Update Gledger"

    assert_text "Gledger was successfully updated"
    click_on "Back"
  end

  test "destroying a Gledger" do
    visit gledgers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Gledger was successfully destroyed"
  end
end
