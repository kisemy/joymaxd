require 'test_helper'

class ProjectTasksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @project_task = project_tasks(:one)
  end

  test "should get index" do
    get project_tasks_url
    assert_response :success
  end

  test "should get new" do
    get new_project_task_url
    assert_response :success
  end

  test "should create project_task" do
    assert_difference('ProjectTask.count') do
      post project_tasks_url, params: { project_task: { actual_end_date: @project_task.actual_end_date, actual_start_date: @project_task.actual_start_date, actual_task_duration: @project_task.actual_task_duration, auto_no: @project_task.auto_no, p_tsk_01: @project_task.p_tsk_01, parallel: @project_task.parallel, percentage_coverage: @project_task.percentage_coverage, percentage_coverage_planned: @project_task.percentage_coverage_planned, planned_end_date: @project_task.planned_end_date, planned_start_date: @project_task.planned_start_date, planned_task_duration: @project_task.planned_task_duration, project_code: @project_task.project_code, task_description: @project_task.task_description, task_no: @project_task.task_no } }
    end

    assert_redirected_to project_task_url(ProjectTask.last)
  end

  test "should show project_task" do
    get project_task_url(@project_task)
    assert_response :success
  end

  test "should get edit" do
    get edit_project_task_url(@project_task)
    assert_response :success
  end

  test "should update project_task" do
    patch project_task_url(@project_task), params: { project_task: { actual_end_date: @project_task.actual_end_date, actual_start_date: @project_task.actual_start_date, actual_task_duration: @project_task.actual_task_duration, auto_no: @project_task.auto_no, p_tsk_01: @project_task.p_tsk_01, parallel: @project_task.parallel, percentage_coverage: @project_task.percentage_coverage, percentage_coverage_planned: @project_task.percentage_coverage_planned, planned_end_date: @project_task.planned_end_date, planned_start_date: @project_task.planned_start_date, planned_task_duration: @project_task.planned_task_duration, project_code: @project_task.project_code, task_description: @project_task.task_description, task_no: @project_task.task_no } }
    assert_redirected_to project_task_url(@project_task)
  end

  test "should destroy project_task" do
    assert_difference('ProjectTask.count', -1) do
      delete project_task_url(@project_task)
    end

    assert_redirected_to project_tasks_url
  end
end
