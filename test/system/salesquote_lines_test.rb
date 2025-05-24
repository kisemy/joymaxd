require "application_system_test_case"

class SalesquoteLinesTest < ApplicationSystemTestCase
  setup do
    @salesquote_line = salesquote_lines(:one)
  end

  test "visiting the index" do
    visit salesquote_lines_url
    assert_selector "h1", text: "Salesquote Lines"
  end

  test "creating a Salesquote line" do
    visit salesquote_lines_url
    click_on "New Salesquote Line"

    fill_in "Amount", with: @salesquote_line.amount
    fill_in "Charge type", with: @salesquote_line.charge_type
    fill_in "Description", with: @salesquote_line.description
    fill_in "Item no", with: @salesquote_line.item_no
    fill_in "Quantity", with: @salesquote_line.quantity
    fill_in "Unit of measure", with: @salesquote_line.unit_of_measure
    fill_in "Unit price", with: @salesquote_line.unit_price
    click_on "Create Salesquote line"

    assert_text "Salesquote line was successfully created"
    click_on "Back"
  end

  test "updating a Salesquote line" do
    visit salesquote_lines_url
    click_on "Edit", match: :first

    fill_in "Amount", with: @salesquote_line.amount
    fill_in "Charge type", with: @salesquote_line.charge_type
    fill_in "Description", with: @salesquote_line.description
    fill_in "Item no", with: @salesquote_line.item_no
    fill_in "Quantity", with: @salesquote_line.quantity
    fill_in "Unit of measure", with: @salesquote_line.unit_of_measure
    fill_in "Unit price", with: @salesquote_line.unit_price
    click_on "Update Salesquote line"

    assert_text "Salesquote line was successfully updated"
    click_on "Back"
  end

  test "destroying a Salesquote line" do
    visit salesquote_lines_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Salesquote line was successfully destroyed"
  end
end
