require "application_system_test_case"

class SubCountiesTest < ApplicationSystemTestCase
  setup do
    @sub_county = sub_counties(:one)
  end

  test "visiting the index" do
    visit sub_counties_url
    assert_selector "h1", text: "Sub Counties"
  end

  test "creating a Sub county" do
    visit sub_counties_url
    click_on "New Sub County"

    fill_in "Sub county code", with: @sub_county.sub_county_code
    fill_in "Sub county name", with: @sub_county.sub_county_name
    click_on "Create Sub county"

    assert_text "Sub county was successfully created"
    click_on "Back"
  end

  test "updating a Sub county" do
    visit sub_counties_url
    click_on "Edit", match: :first

    fill_in "Sub county code", with: @sub_county.sub_county_code
    fill_in "Sub county name", with: @sub_county.sub_county_name
    click_on "Update Sub county"

    assert_text "Sub county was successfully updated"
    click_on "Back"
  end

  test "destroying a Sub county" do
    visit sub_counties_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Sub county was successfully destroyed"
  end
end
