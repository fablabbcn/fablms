require "application_system_test_case"

class StudentsTest < ApplicationSystemTestCase
  setup do
    @student = students(:one)
  end

  test "visiting the index" do
    visit students_url
    assert_selector "h1", text: "Students"
  end

  test "creating a Student" do
    visit students_url
    click_on "New Student"

    fill_in "Code", with: @student.code
    fill_in "Continent", with: @student.continent
    check "Continuing" if @student.continuing
    fill_in "Country", with: @student.country
    fill_in "Course", with: @student.course_id
    fill_in "Email", with: @student.email
    check "Is instructor" if @student.is_instructor
    fill_in "Lab handle", with: @student.lab_handle
    fill_in "Lab name", with: @student.lab_name
    fill_in "Name", with: @student.name
    fill_in "Organization", with: @student.organization_id
    fill_in "Username", with: @student.username
    fill_in "Website path", with: @student.website_path
    click_on "Create Student"

    assert_text "Student was successfully created"
    click_on "Back"
  end

  test "updating a Student" do
    visit students_url
    click_on "Edit", match: :first

    fill_in "Code", with: @student.code
    fill_in "Continent", with: @student.continent
    check "Continuing" if @student.continuing
    fill_in "Country", with: @student.country
    fill_in "Course", with: @student.course_id
    fill_in "Email", with: @student.email
    check "Is instructor" if @student.is_instructor
    fill_in "Lab handle", with: @student.lab_handle
    fill_in "Lab name", with: @student.lab_name
    fill_in "Name", with: @student.name
    fill_in "Organization", with: @student.organization_id
    fill_in "Username", with: @student.username
    fill_in "Website path", with: @student.website_path
    click_on "Update Student"

    assert_text "Student was successfully updated"
    click_on "Back"
  end

  test "destroying a Student" do
    visit students_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Student was successfully destroyed"
  end
end
