require "application_system_test_case"

class ItemLedgersTest < ApplicationSystemTestCase
  setup do
    @item_ledger = item_ledgers(:one)
  end

  test "visiting the index" do
    visit item_ledgers_url
    assert_selector "h1", text: "Item Ledgers"
  end

  test "creating a Item ledger" do
    visit item_ledgers_url
    click_on "New Item Ledger"

    fill_in "Description", with: @item_ledger.description
    fill_in "Document no", with: @item_ledger.document_no
    fill_in "Item no", with: @item_ledger.item_no
    fill_in "Posting date", with: @item_ledger.posting_date
    fill_in "Quantity", with: @item_ledger.quantity
    fill_in "Source no", with: @item_ledger.source_no
    click_on "Create Item ledger"

    assert_text "Item ledger was successfully created"
    click_on "Back"
  end

  test "updating a Item ledger" do
    visit item_ledgers_url
    click_on "Edit", match: :first

    fill_in "Description", with: @item_ledger.description
    fill_in "Document no", with: @item_ledger.document_no
    fill_in "Item no", with: @item_ledger.item_no
    fill_in "Posting date", with: @item_ledger.posting_date
    fill_in "Quantity", with: @item_ledger.quantity
    fill_in "Source no", with: @item_ledger.source_no
    click_on "Update Item ledger"

    assert_text "Item ledger was successfully updated"
    click_on "Back"
  end

  test "destroying a Item ledger" do
    visit item_ledgers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item ledger was successfully destroyed"
  end
end
