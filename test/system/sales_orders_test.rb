require "application_system_test_case"

class SalesOrdersTest < ApplicationSystemTestCase
  setup do
    @sales_order = sales_orders(:one)
  end

  test "visiting the index" do
    visit sales_orders_url
    assert_selector "h1", text: "Sales Orders"
  end

  test "creating a Sales order" do
    visit sales_orders_url
    click_on "New Sales Order"

    fill_in "Address", with: @sales_order.address
    fill_in "City", with: @sales_order.city
    fill_in "Contact name", with: @sales_order.contact_name
    fill_in "Contactno", with: @sales_order.contactno
    fill_in "Customer name", with: @sales_order.customer_name
    fill_in "Customer no", with: @sales_order.customer_no
    fill_in "Order date", with: @sales_order.order_date
    fill_in "Order no", with: @sales_order.order_no
    fill_in "Sales person code", with: @sales_order.sales_person_code
    fill_in "Sales person name", with: @sales_order.sales_person_name
    click_on "Create Sales order"

    assert_text "Sales order was successfully created"
    click_on "Back"
  end

  test "updating a Sales order" do
    visit sales_orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @sales_order.address
    fill_in "City", with: @sales_order.city
    fill_in "Contact name", with: @sales_order.contact_name
    fill_in "Contactno", with: @sales_order.contactno
    fill_in "Customer name", with: @sales_order.customer_name
    fill_in "Customer no", with: @sales_order.customer_no
    fill_in "Order date", with: @sales_order.order_date
    fill_in "Order no", with: @sales_order.order_no
    fill_in "Sales person code", with: @sales_order.sales_person_code
    fill_in "Sales person name", with: @sales_order.sales_person_name
    click_on "Update Sales order"

    assert_text "Sales order was successfully updated"
    click_on "Back"
  end

  test "destroying a Sales order" do
    visit sales_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sales order was successfully destroyed"
  end
end
