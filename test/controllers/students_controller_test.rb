require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @student = students(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get students_url
    assert_response :success
  end

  test "should get new" do
    get new_student_url
    assert_response :success
  end

  test "should create student" do
    assert_difference('Student.count') do
      post students_url, params: { student: { code: @student.code, continent: @student.continent, continuing: @student.continuing, country: @student.country, course_id: @student.course_id, email: @student.email, is_instructor: @student.is_instructor, lab_handle: @student.lab_handle, lab_name: @student.lab_name, name: @student.name, organization_id: @student.organization_id, username: 'user3', website_path: @student.website_path } }
    end

    assert_redirected_to students_url
  end

  test "should show student" do
    get student_url(@student)
    assert_response :success
  end

  test "should get edit" do
    get edit_student_url(@student)
    assert_response :success
  end

  test "should update student" do
    patch student_url(@student), params: { student: { code: @student.code, continent: @student.continent, continuing: @student.continuing, country: @student.country, course_id: @student.course_id, email: @student.email, is_instructor: @student.is_instructor, lab_handle: @student.lab_handle, lab_name: @student.lab_name, name: @student.name, organization_id: @student.organization_id, username: @student.username, website_path: @student.website_path } }
    assert_redirected_to student_url(@student)
  end

  test "should destroy student" do
    assert_difference('Student.count', -1) do
      delete student_url(@student)
    end

    assert_redirected_to students_url
  end
end
