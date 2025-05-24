require "application_system_test_case"

class StocklinesTest < ApplicationSystemTestCase
  setup do
    @stockline = stocklines(:one)
  end

  test "visiting the index" do
    visit stocklines_url
    assert_selector "h1", text: "Stocklines"
  end

  test "creating a Stockline" do
    visit stocklines_url
    click_on "New Stockline"

    fill_in "Amount", with: @stockline.amount
    fill_in "Batch no", with: @stockline.batch_no
    fill_in "Code", with: @stockline.code
    fill_in "Comment", with: @stockline.comment
    fill_in "Date", with: @stockline.date
    fill_in "Expiry date", with: @stockline.expiry_date
    fill_in "Product category", with: @stockline.product_category
    fill_in "Product description", with: @stockline.product_description
    fill_in "Quality check", with: @stockline.quality_check
    fill_in "Quantity", with: @stockline.quantity
    fill_in "Quantity expected", with: @stockline.quantity_expected
    check "Received" if @stockline.received
    fill_in "Ref no", with: @stockline.ref_no
    fill_in "Stockin headers", with: @stockline.stockin_headers_id
    fill_in "Unit cost", with: @stockline.unit_cost
    fill_in "Unit of measure", with: @stockline.unit_of_measure
    fill_in "Unit price", with: @stockline.unit_price
    fill_in "Warehouse code", with: @stockline.warehouse_code
    fill_in "Warehouse name", with: @stockline.warehouse_name
    click_on "Create Stockline"

    assert_text "Stockline was successfully created"
    click_on "Back"
  end

  test "updating a Stockline" do
    visit stocklines_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @stockline.amount
    fill_in "Batch no", with: @stockline.batch_no
    fill_in "Code", with: @stockline.code
    fill_in "Comment", with: @stockline.comment
    fill_in "Date", with: @stockline.date
    fill_in "Expiry date", with: @stockline.expiry_date
    fill_in "Product category", with: @stockline.product_category
    fill_in "Product description", with: @stockline.product_description
    fill_in "Quality check", with: @stockline.quality_check
    fill_in "Quantity", with: @stockline.quantity
    fill_in "Quantity expected", with: @stockline.quantity_expected
    check "Received" if @stockline.received
    fill_in "Ref no", with: @stockline.ref_no
    fill_in "Stockin headers", with: @stockline.stockin_headers_id
    fill_in "Unit cost", with: @stockline.unit_cost
    fill_in "Unit of measure", with: @stockline.unit_of_measure
    fill_in "Unit price", with: @stockline.unit_price
    fill_in "Warehouse code", with: @stockline.warehouse_code
    fill_in "Warehouse name", with: @stockline.warehouse_name
    click_on "Update Stockline"

    assert_text "Stockline was successfully updated"
    click_on "Back"
  end

  test "destroying a Stockline" do
    visit stocklines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stockline was successfully destroyed"
  end
end
