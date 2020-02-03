class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  # GET /students.json
  def index
    @students = current_user.organization.students
  end

  def edit_multiple
    puts '---- Perform on multiple students ----'
    puts params[:student_ids]

    Gitlab.endpoint = current_user.selected_organization.gitlab_url
    Gitlab.private_token = current_user.selected_organization.gitlab_token

    @gitlab_users = []
    params[:student_ids].each do |i|
      stud = current_user.organization.students.find(i)
      next if stud.email.blank?

      # TODO: Do something with user on gitlab
      user_in_gitlab = Gitlab.user_search(stud.email)
      @gitlab_users << user_in_gitlab if user_in_gitlab.any?
    end

    respond_to do |format|
      format.js
    end
  end

  def import
    Student.import_csv(params[:file], current_user.selected_organization, params[:course_id])
    redirect_to course_url(params[:course_id]), notice: 'Students created'
  end

  # GET /students/1
  # GET /students/1.json
  def show
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # GET /students/1/edit
  def edit
  end

  # POST /students
  # POST /students.json
  def create
    @student = Student.new(student_params.merge(organization_id: current_user.organization_id))

    respond_to do |format|
      if @student.save
        format.html { redirect_to students_url, notice: 'Student was successfully created.' }
        format.json { render :show, status: :created, location: @student }
      else
        format.html { render :new }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /students/1
  # PATCH/PUT /students/1.json
  def update
    respond_to do |format|
      if @student.update(student_params)
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render :show, status: :ok, location: @student }
      else
        format.html { render :edit }
        format.json { render json: @student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.json
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student
      @student = Student.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_params
      params.require(:student).permit(:code, :name, :username, :email, :continuing, :is_instructor, :lab_name, :lab_handle, :country, :continent, :website_path, :organization_id, :course_id)
    end
end
