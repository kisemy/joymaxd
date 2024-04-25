require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    @item = items(:one)
  end

  test "visiting the index" do
    visit items_url
    assert_selector "h1", text: "Items"
  end

  test "creating a Item" do
    visit items_url
    click_on "New Item"

    fill_in "Description", with: @item.description
    fill_in "Inventory", with: @item.inventory
    fill_in "Item category", with: @item.item_category
    fill_in "Shelf no", with: @item.shelf_no
    fill_in "Unit cost", with: @item.unit_cost
    fill_in "Unit price", with: @item.unit_price
    fill_in "Units of measure", with: @item.units_of_measure
    click_on "Create Item"

    assert_text "Item was successfully created"
    click_on "Back"
  end

  test "updating a Item" do
    visit items_url
    click_on "Edit", match: :first

    fill_in "Description", with: @item.description
    fill_in "Inventory", with: @item.inventory
    fill_in "Item category", with: @item.item_category
    fill_in "Shelf no", with: @item.shelf_no
    fill_in "Unit cost", with: @item.unit_cost
    fill_in "Unit price", with: @item.unit_price
    fill_in "Units of measure", with: @item.units_of_measure
    click_on "Update Item"

    assert_text "Item was successfully updated"
    click_on "Back"
  end

  test "destroying a Item" do
    visit items_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item was successfully destroyed"
  end
end
