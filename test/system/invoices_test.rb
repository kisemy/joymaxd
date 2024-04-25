require "application_system_test_case"

class InvoicesTest < ApplicationSystemTestCase
  setup do
    @invoice = invoices(:one)
  end

  test "visiting the index" do
    visit invoices_url
    assert_selector "h1", text: "Invoices"
  end

  test "creating a Invoice" do
    visit invoices_url
    click_on "New Invoice"

    fill_in "Address", with: @invoice.address
    fill_in "City", with: @invoice.city
    fill_in "Contact name", with: @invoice.contact_name
    fill_in "Contactno", with: @invoice.contactno
    fill_in "Customer name", with: @invoice.customer_name
    fill_in "Date", with: @invoice.date
    fill_in "Sales person code", with: @invoice.sales_person_code
    fill_in "Sales person name", with: @invoice.sales_person_name
    click_on "Create Invoice"

    assert_text "Invoice was successfully created"
    click_on "Back"
  end

  test "updating a Invoice" do
    visit invoices_url
    click_on "Edit", match: :first

    fill_in "Address", with: @invoice.address
    fill_in "City", with: @invoice.city
    fill_in "Contact name", with: @invoice.contact_name
    fill_in "Contactno", with: @invoice.contactno
    fill_in "Customer name", with: @invoice.customer_name
    fill_in "Date", with: @invoice.date
    fill_in "Sales person code", with: @invoice.sales_person_code
    fill_in "Sales person name", with: @invoice.sales_person_name
    click_on "Update Invoice"

    assert_text "Invoice was successfully updated"
    click_on "Back"
  end

  test "destroying a Invoice" do
    visit invoices_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invoice was successfully destroyed"
  end
end
