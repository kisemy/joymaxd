require "application_system_test_case"

class StockinHeadersTest < ApplicationSystemTestCase
  setup do
    @stockin_header = stockin_headers(:one)
  end

  test "visiting the index" do
    visit stockin_headers_url
    assert_selector "h1", text: "Stockin Headers"
  end

  test "creating a Stockin header" do
    visit stockin_headers_url
    click_on "New Stockin Header"

    fill_in "Po no", with: @stockin_header.PO_no
    fill_in "Donor", with: @stockin_header.donor
    fill_in "Donor name", with: @stockin_header.donor_name
    fill_in "Invoice no", with: @stockin_header.invoice_no
    fill_in "Project code", with: @stockin_header.project_code
    fill_in "Project name", with: @stockin_header.project_name
    check "Received" if @stockin_header.received
    fill_in "Received by", with: @stockin_header.received_by
    fill_in "Received date", with: @stockin_header.received_date
    fill_in "Source address", with: @stockin_header.source_address
    fill_in "Source code", with: @stockin_header.source_code
    fill_in "Source email", with: @stockin_header.source_email
    fill_in "Source name", with: @stockin_header.source_name
    fill_in "Source telephone", with: @stockin_header.source_telephone
    fill_in "Source type", with: @stockin_header.source_type
    fill_in "Stk no", with: @stockin_header.stk_no
    fill_in "Supplier address", with: @stockin_header.supplier_address
    fill_in "Supplier code", with: @stockin_header.supplier_code
    fill_in "Supplier email", with: @stockin_header.supplier_email
    fill_in "Supplier name", with: @stockin_header.supplier_name
    fill_in "Telephone", with: @stockin_header.telephone
    fill_in "Warehouse location code", with: @stockin_header.warehouse_location_code
    fill_in "Warehouse location name", with: @stockin_header.warehouse_location_name
    click_on "Create Stockin header"

    assert_text "Stockin header was successfully created"
    click_on "Back"
  end

  test "updating a Stockin header" do
    visit stockin_headers_url
    click_on "Edit", match: :first

    fill_in "Po no", with: @stockin_header.PO_no
    fill_in "Donor", with: @stockin_header.donor
    fill_in "Donor name", with: @stockin_header.donor_name
    fill_in "Invoice no", with: @stockin_header.invoice_no
    fill_in "Project code", with: @stockin_header.project_code
    fill_in "Project name", with: @stockin_header.project_name
    check "Received" if @stockin_header.received
    fill_in "Received by", with: @stockin_header.received_by
    fill_in "Received date", with: @stockin_header.received_date
    fill_in "Source address", with: @stockin_header.source_address
    fill_in "Source code", with: @stockin_header.source_code
    fill_in "Source email", with: @stockin_header.source_email
    fill_in "Source name", with: @stockin_header.source_name
    fill_in "Source telephone", with: @stockin_header.source_telephone
    fill_in "Source type", with: @stockin_header.source_type
    fill_in "Stk no", with: @stockin_header.stk_no
    fill_in "Supplier address", with: @stockin_header.supplier_address
    fill_in "Supplier code", with: @stockin_header.supplier_code
    fill_in "Supplier email", with: @stockin_header.supplier_email
    fill_in "Supplier name", with: @stockin_header.supplier_name
    fill_in "Telephone", with: @stockin_header.telephone
    fill_in "Warehouse location code", with: @stockin_header.warehouse_location_code
    fill_in "Warehouse location name", with: @stockin_header.warehouse_location_name
    click_on "Update Stockin header"

    assert_text "Stockin header was successfully updated"
    click_on "Back"
  end

  test "destroying a Stockin header" do
    visit stockin_headers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Stockin header was successfully destroyed"
  end
end
