require "application_system_test_case"

class SalesQuotesTest < ApplicationSystemTestCase
  setup do
    @sales_quote = sales_quotes(:one)
  end

  test "visiting the index" do
    visit sales_quotes_url
    assert_selector "h1", text: "Sales Quotes"
  end

  test "creating a Sales quote" do
    visit sales_quotes_url
    click_on "New Sales Quote"

    fill_in "Qtn no", with: @sales_quote.QTN_no
    fill_in "Address", with: @sales_quote.address
    fill_in "City", with: @sales_quote.city
    fill_in "Contact name", with: @sales_quote.contact_name
    fill_in "Contactno", with: @sales_quote.contactno
    fill_in "Customer name", with: @sales_quote.customer_name
    fill_in "Customer no", with: @sales_quote.customer_no
    fill_in "Quote date", with: @sales_quote.quote_date
    fill_in "Sales person code", with: @sales_quote.sales_person_code
    fill_in "Sales person name", with: @sales_quote.sales_person_name
    click_on "Create Sales quote"

    assert_text "Sales quote was successfully created"
    click_on "Back"
  end

  test "updating a Sales quote" do
    visit sales_quotes_url
    click_on "Edit", match: :first

    fill_in "Qtn no", with: @sales_quote.QTN_no
    fill_in "Address", with: @sales_quote.address
    fill_in "City", with: @sales_quote.city
    fill_in "Contact name", with: @sales_quote.contact_name
    fill_in "Contactno", with: @sales_quote.contactno
    fill_in "Customer name", with: @sales_quote.customer_name
    fill_in "Customer no", with: @sales_quote.customer_no
    fill_in "Quote date", with: @sales_quote.quote_date
    fill_in "Sales person code", with: @sales_quote.sales_person_code
    fill_in "Sales person name", with: @sales_quote.sales_person_name
    click_on "Update Sales quote"

    assert_text "Sales quote was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales quote" do
    visit sales_quotes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales quote was successfully destroyed"
  end
end
