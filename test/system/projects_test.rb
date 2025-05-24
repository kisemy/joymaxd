require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  setup do
    @project = projects(:one)
  end

  test "visiting the index" do
    visit projects_url
    assert_selector "h1", text: "Projects"
  end

  test "creating a Project" do
    visit projects_url
    click_on "New Project"

    fill_in "Actual", with: @project.actual
    fill_in "Brief description", with: @project.brief_description
    fill_in "Budgeted", with: @project.budgeted
    fill_in "Department", with: @project.department
    fill_in "End date", with: @project.end_date
    fill_in "Financial year", with: @project.financial_year
    fill_in "Latitude", with: @project.latitude
    fill_in "Longitude", with: @project.longitude
    fill_in "Project name", with: @project.project_name
    fill_in "Project no", with: @project.project_no
    fill_in "Project status", with: @project.project_status
    fill_in "Start date", with: @project.start_date
    fill_in "Sub county", with: @project.sub_county
    fill_in "Village", with: @project.village
    fill_in "Ward", with: @project.ward
    click_on "Create Project"

    assert_text "Project was successfully created"
    click_on "Back"
  end

  test "updating a Project" do
    visit projects_url
    click_on "Edit", match: :first

    fill_in "Actual", with: @project.actual
    fill_in "Brief description", with: @project.brief_description
    fill_in "Budgeted", with: @project.budgeted
    fill_in "Department", with: @project.department
    fill_in "End date", with: @project.end_date
    fill_in "Financial year", with: @project.financial_year
    fill_in "Latitude", with: @project.latitude
    fill_in "Longitude", with: @project.longitude
    fill_in "Project name", with: @project.project_name
    fill_in "Project no", with: @project.project_no
    fill_in "Project status", with: @project.project_status
    fill_in "Start date", with: @project.start_date
    fill_in "Sub county", with: @project.sub_county
    fill_in "Village", with: @project.village
    fill_in "Ward", with: @project.ward
    click_on "Update Project"

    assert_text "Project was successfully updated"
    click_on "Back"
  end

  test "destroying a Project" do
    visit projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Project was successfully destroyed"
  end
end
