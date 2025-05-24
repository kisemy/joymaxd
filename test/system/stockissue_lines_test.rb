require "application_system_test_case"

class StockissueLinesTest < ApplicationSystemTestCase
  setup do
    @stockissue_line = stockissue_lines(:one)
  end

  test "visiting the index" do
    visit stockissue_lines_url
    assert_selector "h1", text: "Stockissue Lines"
  end

  test "creating a Stockissue line" do
    visit stockissue_lines_url
    click_on "New Stockissue Line"

    fill_in "Amount", with: @stockissue_line.amount
    fill_in "Batch no", with: @stockissue_line.batch_no
    fill_in "Batch quantity", with: @stockissue_line.batch_quantity
    fill_in "Client code", with: @stockissue_line.client_code
    fill_in "Client name", with: @stockissue_line.client_name
    fill_in "Code", with: @stockissue_line.code
    check "Expired" if @stockissue_line.expired
    fill_in "Expiry date", with: @stockissue_line.expiry_date
    check "Issued" if @stockissue_line.issued
    fill_in "Issued quantity", with: @stockissue_line.issued_quantity
    fill_in "Latest expiry", with: @stockissue_line.latest_expiry
    fill_in "Product description", with: @stockissue_line.product_description
    fill_in "Stock balance", with: @stockissue_line.stock_balance
    fill_in "Stockout header", with: @stockissue_line.stockout_header_id
    fill_in "Unit cost", with: @stockissue_line.unit_cost
    click_on "Create Stockissue line"

    assert_text "Stockissue line was successfully created"
    click_on "Back"
  end

  test "updating a Stockissue line" do
    visit stockissue_lines_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @stockissue_line.amount
    fill_in "Batch no", with: @stockissue_line.batch_no
    fill_in "Batch quantity", with: @stockissue_line.batch_quantity
    fill_in "Client code", with: @stockissue_line.client_code
    fill_in "Client name", with: @stockissue_line.client_name
    fill_in "Code", with: @stockissue_line.code
    check "Expired" if @stockissue_line.expired
    fill_in "Expiry date", with: @stockissue_line.expiry_date
    check "Issued" if @stockissue_line.issued
    fill_in "Issued quantity", with: @stockissue_line.issued_quantity
    fill_in "Latest expiry", with: @stockissue_line.latest_expiry
    fill_in "Product description", with: @stockissue_line.product_description
    fill_in "Stock balance", with: @stockissue_line.stock_balance
    fill_in "Stockout header", with: @stockissue_line.stockout_header_id
    fill_in "Unit cost", with: @stockissue_line.unit_cost
    click_on "Update Stockissue line"

    assert_text "Stockissue line was successfully updated"
    click_on "Back"
  end

  test "destroying a Stockissue line" do
    visit stockissue_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stockissue line was successfully destroyed"
  end
end
