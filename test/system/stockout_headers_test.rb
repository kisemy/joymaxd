require "application_system_test_case"

class StockoutHeadersTest < ApplicationSystemTestCase
  setup do
    @stockout_header = stockout_headers(:one)
  end

  test "visiting the index" do
    visit stockout_headers_url
    assert_selector "h1", text: "Stockout Headers"
  end

  test "creating a Stockout header" do
    visit stockout_headers_url
    click_on "New Stockout Header"

    fill_in "Address", with: @stockout_header.address
    fill_in "Client category", with: @stockout_header.client_category
    fill_in "Client code", with: @stockout_header.client_code
    fill_in "Client name", with: @stockout_header.client_name
    fill_in "Email", with: @stockout_header.email
    check "Issued" if @stockout_header.issued
    fill_in "Release date", with: @stockout_header.release_date
    fill_in "Request date", with: @stockout_header.request_date
    fill_in "Request no", with: @stockout_header.request_no
    fill_in "Requested by", with: @stockout_header.requested_by
    fill_in "Status", with: @stockout_header.status
    fill_in "Stko", with: @stockout_header.stko
    fill_in "Telephone", with: @stockout_header.telephone
    fill_in "Warehouse code", with: @stockout_header.warehouse_code
    fill_in "Warehouse name", with: @stockout_header.warehouse_name
    click_on "Create Stockout header"

    assert_text "Stockout header was successfully created"
    click_on "Back"
  end

  test "updating a Stockout header" do
    visit stockout_headers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @stockout_header.address
    fill_in "Client category", with: @stockout_header.client_category
    fill_in "Client code", with: @stockout_header.client_code
    fill_in "Client name", with: @stockout_header.client_name
    fill_in "Email", with: @stockout_header.email
    check "Issued" if @stockout_header.issued
    fill_in "Release date", with: @stockout_header.release_date
    fill_in "Request date", with: @stockout_header.request_date
    fill_in "Request no", with: @stockout_header.request_no
    fill_in "Requested by", with: @stockout_header.requested_by
    fill_in "Status", with: @stockout_header.status
    fill_in "Stko", with: @stockout_header.stko
    fill_in "Telephone", with: @stockout_header.telephone
    fill_in "Warehouse code", with: @stockout_header.warehouse_code
    fill_in "Warehouse name", with: @stockout_header.warehouse_name
    click_on "Update Stockout header"

    assert_text "Stockout header was successfully updated"
    click_on "Back"
  end

  test "destroying a Stockout header" do
    visit stockout_headers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stockout header was successfully destroyed"
  end
end
