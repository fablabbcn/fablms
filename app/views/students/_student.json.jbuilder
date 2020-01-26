json.extract! student, :id, :code, :name, :username, :email, :continuing, :is_instructor, :lab_name, :lab_handle, :country, :continent, :website_path, :organization_id, :course_id, :created_at, :updated_at
json.url student_url(student, format: :json)
