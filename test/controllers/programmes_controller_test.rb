require 'test_helper'

class ProgrammesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @programme = programmes(:one)
  end

  test "should get index" do
    get programmes_url
    assert_response :success
  end

  test "should get new" do
    get new_programme_url
    assert_response :success
  end

  test "should create programme" do
    assert_difference('Programme.count') do
      post programmes_url, params: { programme: { complete_projects: @programme.complete_projects, current_co_email: @programme.current_co_email, current_co_pno: @programme.current_co_pno, current_co_telephone: @programme.current_co_telephone, department_code: @programme.department_code, department_name: @programme.department_name, general_programme_email: @programme.general_programme_email, programme_code: @programme.programme_code, programme_name: @programme.programme_name, projects_in_progress: @programme.projects_in_progress } }
    end

    assert_redirected_to programme_url(Programme.last)
  end

  test "should show programme" do
    get programme_url(@programme)
    assert_response :success
  end

  test "should get edit" do
    get edit_programme_url(@programme)
    assert_response :success
  end

  test "should update programme" do
    patch programme_url(@programme), params: { programme: { complete_projects: @programme.complete_projects, current_co_email: @programme.current_co_email, current_co_pno: @programme.current_co_pno, current_co_telephone: @programme.current_co_telephone, department_code: @programme.department_code, department_name: @programme.department_name, general_programme_email: @programme.general_programme_email, programme_code: @programme.programme_code, programme_name: @programme.programme_name, projects_in_progress: @programme.projects_in_progress } }
    assert_redirected_to programme_url(@programme)
  end

  test "should destroy programme" do
    assert_difference('Programme.count', -1) do
      delete programme_url(@programme)
    end

    assert_redirected_to programmes_url
  end
end
