require "application_system_test_case"

class StoreRequestsTest < ApplicationSystemTestCase
  setup do
    @store_request = store_requests(:one)
  end

  test "visiting the index" do
    visit store_requests_url
    assert_selector "h1", text: "Store Requests"
  end

  test "creating a Store request" do
    visit store_requests_url
    click_on "New Store Request"

    fill_in "Warehouse name", with: @store_request.Warehouse_name
    fill_in "Delivery place", with: @store_request.delivery_place
    fill_in "Destination code", with: @store_request.destination_code
    fill_in "Destination name", with: @store_request.destination_name
    fill_in "Invoice no", with: @store_request.invoice_no
    fill_in "Request date", with: @store_request.request_date
    fill_in "Request status", with: @store_request.request_status
    fill_in "Requsted by", with: @store_request.requsted_by
    fill_in "Status", with: @store_request.status
    fill_in "Warehouse code", with: @store_request.warehouse_code
    click_on "Create Store request"

    assert_text "Store request was successfully created"
    click_on "Back"
  end

  test "updating a Store request" do
    visit store_requests_url
    click_on "Edit", match: :first

    fill_in "Warehouse name", with: @store_request.Warehouse_name
    fill_in "Delivery place", with: @store_request.delivery_place
    fill_in "Destination code", with: @store_request.destination_code
    fill_in "Destination name", with: @store_request.destination_name
    fill_in "Invoice no", with: @store_request.invoice_no
    fill_in "Request date", with: @store_request.request_date
    fill_in "Request status", with: @store_request.request_status
    fill_in "Requsted by", with: @store_request.requsted_by
    fill_in "Status", with: @store_request.status
    fill_in "Warehouse code", with: @store_request.warehouse_code
    click_on "Update Store request"

    assert_text "Store request was successfully updated"
    click_on "Back"
  end

  test "destroying a Store request" do
    visit store_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Store request was successfully destroyed"
  end
end
