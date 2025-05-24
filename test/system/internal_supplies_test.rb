require "application_system_test_case"

class InternalSuppliesTest < ApplicationSystemTestCase
  setup do
    @internal_supply = internal_supplies(:one)
  end

  test "visiting the index" do
    visit internal_supplies_url
    assert_selector "h1", text: "Internal Supplies"
  end

  test "creating a Internal supply" do
    visit internal_supplies_url
    click_on "New Internal Supply"

    fill_in "Supplier name", with: @internal_supply.supplier_name
    click_on "Create Internal supply"

    assert_text "Internal supply was successfully created"
    click_on "Back"
  end

  test "updating a Internal supply" do
    visit internal_supplies_url
    click_on "Edit", match: :first

    fill_in "Supplier name", with: @internal_supply.supplier_name
    click_on "Update Internal supply"

    assert_text "Internal supply was successfully updated"
    click_on "Back"
  end

  test "destroying a Internal supply" do
    visit internal_supplies_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Internal supply was successfully destroyed"
  end
end
