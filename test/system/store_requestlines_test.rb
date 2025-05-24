require "application_system_test_case"

class StoreRequestlinesTest < ApplicationSystemTestCase
  setup do
    @store_requestline = store_requestlines(:one)
  end

  test "visiting the index" do
    visit store_requestlines_url
    assert_selector "h1", text: "Store Requestlines"
  end

  test "creating a Store requestline" do
    visit store_requestlines_url
    click_on "New Store Requestline"

    fill_in "Amount", with: @store_requestline.amount
    fill_in "Batch no", with: @store_requestline.batch_no
    fill_in "Code", with: @store_requestline.code
    fill_in "Destination code", with: @store_requestline.destination_code
    fill_in "Destination name", with: @store_requestline.destination_name
    fill_in "Expiry date", with: @store_requestline.expiry_date
    fill_in "Product description", with: @store_requestline.product_description
    fill_in "Quantity", with: @store_requestline.quantity
    check "Received" if @store_requestline.received
    fill_in "Stock balance", with: @store_requestline.stock_balance
    fill_in "Store request", with: @store_requestline.store_request_id
    fill_in "Unit cost", with: @store_requestline.unit_cost
    click_on "Create Store requestline"

    assert_text "Store requestline was successfully created"
    click_on "Back"
  end

  test "updating a Store requestline" do
    visit store_requestlines_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @store_requestline.amount
    fill_in "Batch no", with: @store_requestline.batch_no
    fill_in "Code", with: @store_requestline.code
    fill_in "Destination code", with: @store_requestline.destination_code
    fill_in "Destination name", with: @store_requestline.destination_name
    fill_in "Expiry date", with: @store_requestline.expiry_date
    fill_in "Product description", with: @store_requestline.product_description
    fill_in "Quantity", with: @store_requestline.quantity
    check "Received" if @store_requestline.received
    fill_in "Stock balance", with: @store_requestline.stock_balance
    fill_in "Store request", with: @store_requestline.store_request_id
    fill_in "Unit cost", with: @store_requestline.unit_cost
    click_on "Update Store requestline"

    assert_text "Store requestline was successfully updated"
    click_on "Back"
  end

  test "destroying a Store requestline" do
    visit store_requestlines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store requestline was successfully destroyed"
  end
end
