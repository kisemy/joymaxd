require "application_system_test_case"

class ProgrammesTest < ApplicationSystemTestCase
  setup do
    @programme = programmes(:one)
  end

  test "visiting the index" do
    visit programmes_url
    assert_selector "h1", text: "Programmes"
  end

  test "creating a Programme" do
    visit programmes_url
    click_on "New Programme"

    fill_in "Complete projects", with: @programme.complete_projects
    fill_in "Current co email", with: @programme.current_co_email
    fill_in "Current co pno", with: @programme.current_co_pno
    fill_in "Current co telephone", with: @programme.current_co_telephone
    fill_in "Department code", with: @programme.department_code
    fill_in "Department name", with: @programme.department_name
    fill_in "General programme email", with: @programme.general_programme_email
    fill_in "Programme code", with: @programme.programme_code
    fill_in "Programme name", with: @programme.programme_name
    fill_in "Projects in progress", with: @programme.projects_in_progress
    click_on "Create Programme"

    assert_text "Programme was successfully created"
    click_on "Back"
  end

  test "updating a Programme" do
    visit programmes_url
    click_on "Edit", match: :first

    fill_in "Complete projects", with: @programme.complete_projects
    fill_in "Current co email", with: @programme.current_co_email
    fill_in "Current co pno", with: @programme.current_co_pno
    fill_in "Current co telephone", with: @programme.current_co_telephone
    fill_in "Department code", with: @programme.department_code
    fill_in "Department name", with: @programme.department_name
    fill_in "General programme email", with: @programme.general_programme_email
    fill_in "Programme code", with: @programme.programme_code
    fill_in "Programme name", with: @programme.programme_name
    fill_in "Projects in progress", with: @programme.projects_in_progress
    click_on "Update Programme"

    assert_text "Programme was successfully updated"
    click_on "Back"
  end

  test "destroying a Programme" do
    visit programmes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Programme was successfully destroyed"
  end
end
