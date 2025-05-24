require 'test_helper'

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get projects_url
    assert_response :success
  end

  test "should get new" do
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post projects_url, params: { project: { actual: @project.actual, brief_description: @project.brief_description, budgeted: @project.budgeted, department: @project.department, end_date: @project.end_date, financial_year: @project.financial_year, latitude: @project.latitude, longitude: @project.longitude, project_name: @project.project_name, project_no: @project.project_no, project_status: @project.project_status, start_date: @project.start_date, sub_county: @project.sub_county, village: @project.village, ward: @project.ward } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should show project" do
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    patch project_url(@project), params: { project: { actual: @project.actual, brief_description: @project.brief_description, budgeted: @project.budgeted, department: @project.department, end_date: @project.end_date, financial_year: @project.financial_year, latitude: @project.latitude, longitude: @project.longitude, project_name: @project.project_name, project_no: @project.project_no, project_status: @project.project_status, start_date: @project.start_date, sub_county: @project.sub_county, village: @project.village, ward: @project.ward } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
