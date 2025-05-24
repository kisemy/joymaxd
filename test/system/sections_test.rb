require "application_system_test_case"

class SectionsTest < ApplicationSystemTestCase
  setup do
    @section = sections(:one)
  end

  test "visiting the index" do
    visit sections_url
    assert_selector "h1", text: "Sections"
  end

  test "creating a Section" do
    visit sections_url
    click_on "New Section"

    fill_in "Complete projects", with: @section.complete_projects
    fill_in "Current co email", with: @section.current_co_email
    fill_in "Current co name", with: @section.current_co_name
    fill_in "Current co telephone", with: @section.current_co_telephone
    fill_in "Department code", with: @section.department_code
    fill_in "Department name", with: @section.department_name
    fill_in "General section email", with: @section.general_section_email
    fill_in "Projects in progress", with: @section.projects_in_progress
    fill_in "Section code", with: @section.section_code
    fill_in "Section name", with: @section.section_name
    click_on "Create Section"

    assert_text "Section was successfully created"
    click_on "Back"
  end

  test "updating a Section" do
    visit sections_url
    click_on "Edit", match: :first

    fill_in "Complete projects", with: @section.complete_projects
    fill_in "Current co email", with: @section.current_co_email
    fill_in "Current co name", with: @section.current_co_name
    fill_in "Current co telephone", with: @section.current_co_telephone
    fill_in "Department code", with: @section.department_code
    fill_in "Department name", with: @section.department_name
    fill_in "General section email", with: @section.general_section_email
    fill_in "Projects in progress", with: @section.projects_in_progress
    fill_in "Section code", with: @section.section_code
    fill_in "Section name", with: @section.section_name
    click_on "Update Section"

    assert_text "Section was successfully updated"
    click_on "Back"
  end

  test "destroying a Section" do
    visit sections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Section was successfully destroyed"
  end
end
