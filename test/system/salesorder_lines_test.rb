require "application_system_test_case"

class SalesorderLinesTest < ApplicationSystemTestCase
  setup do
    @salesorder_line = salesorder_lines(:one)
  end

  test "visiting the index" do
    visit salesorder_lines_url
    assert_selector "h1", text: "Salesorder Lines"
  end

  test "creating a Salesorder line" do
    visit salesorder_lines_url
    click_on "New Salesorder Line"

    fill_in "Amount", with: @salesorder_line.amount
    fill_in "Charge type", with: @salesorder_line.charge_type
    fill_in "Description", with: @salesorder_line.description
    fill_in "Item no", with: @salesorder_line.item_no
    fill_in "Quantity", with: @salesorder_line.quantity
    fill_in "Unit of measure", with: @salesorder_line.unit_of_measure
    fill_in "Unit price", with: @salesorder_line.unit_price
    click_on "Create Salesorder line"

    assert_text "Salesorder line was successfully created"
    click_on "Back"
  end

  test "updating a Salesorder line" do
    visit salesorder_lines_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @salesorder_line.amount
    fill_in "Charge type", with: @salesorder_line.charge_type
    fill_in "Description", with: @salesorder_line.description
    fill_in "Item no", with: @salesorder_line.item_no
    fill_in "Quantity", with: @salesorder_line.quantity
    fill_in "Unit of measure", with: @salesorder_line.unit_of_measure
    fill_in "Unit price", with: @salesorder_line.unit_price
    click_on "Update Salesorder line"

    assert_text "Salesorder line was successfully updated"
    click_on "Back"
  end

  test "destroying a Salesorder line" do
    visit salesorder_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salesorder line was successfully destroyed"
  end
end
