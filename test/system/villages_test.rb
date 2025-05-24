require "application_system_test_case"

class VillagesTest < ApplicationSystemTestCase
  setup do
    @village = villages(:one)
  end

  test "visiting the index" do
    visit villages_url
    assert_selector "h1", text: "Villages"
  end

  test "creating a Village" do
    visit villages_url
    click_on "New Village"

    fill_in "Sub county code", with: @village.sub_county_code
    fill_in "Sub county name", with: @village.sub_county_name
    fill_in "Village admin email", with: @village.village_admin_email
    fill_in "Village admin name", with: @village.village_admin_name
    fill_in "Village admin pno", with: @village.village_admin_pno
    fill_in "Village admin telephone", with: @village.village_admin_telephone
    fill_in "Village code", with: @village.village_code
    fill_in "Village name", with: @village.village_name
    fill_in "Ward code", with: @village.ward_code
    fill_in "Ward name", with: @village.ward_name
    click_on "Create Village"

    assert_text "Village was successfully created"
    click_on "Back"
  end

  test "updating a Village" do
    visit villages_url
    click_on "Edit", match: :first

    fill_in "Sub county code", with: @village.sub_county_code
    fill_in "Sub county name", with: @village.sub_county_name
    fill_in "Village admin email", with: @village.village_admin_email
    fill_in "Village admin name", with: @village.village_admin_name
    fill_in "Village admin pno", with: @village.village_admin_pno
    fill_in "Village admin telephone", with: @village.village_admin_telephone
    fill_in "Village code", with: @village.village_code
    fill_in "Village name", with: @village.village_name
    fill_in "Ward code", with: @village.ward_code
    fill_in "Ward name", with: @village.ward_name
    click_on "Update Village"

    assert_text "Village was successfully updated"
    click_on "Back"
  end

  test "destroying a Village" do
    visit villages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Village was successfully destroyed"
  end
end
