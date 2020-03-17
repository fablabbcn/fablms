class OrganizationsController < ApplicationController
  before_action :set_organization, only: [:show, :edit, :update, :destroy]
  before_action :prepare_gitlab_connection

  require 'gitlab'

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = current_user.organizations
  end

  def prepare_gitlab_connection
    Gitlab.endpoint = current_user.selected_organization.gitlab_url
    Gitlab.private_token = current_user.selected_organization.gitlab_token
  end

  def issue_list
    @issues = Gitlab.issues(params[:group_id]).auto_paginate
    respond_to do |format|
      format.js
    end
  end

  def group_members
    @members = Gitlab.group_members(params[:group_id]).auto_paginate
    respond_to do |format|
      format.js
    end
  end

  def group_projects
    @projects = Gitlab.group_projects(params[:group_id]).auto_paginate
    respond_to do |format|
      format.js
    end
  end

  def group_subgroups
    @groups = Gitlab.group_subgroups(params[:group_id]).auto_paginate
    respond_to do |format|
      format.js
    end
  end

  def gitlab_check
    if params[:item] == 'version'
      @version = Gitlab.version.version
    elsif params[:item] == 'students'
      @members = Gitlab.group_members(current_user.selected_organization.gitlab_folder_id).auto_paginate
    else
      @response = Gitlab.group(current_user.selected_organization.gitlab_folder_id)
    end

    respond_to do |format|
      format.js
    end
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    current_user.user_organizations.create! organization: @organization

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: 'Organization was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organization
      @organization = current_user.organizations.find(params[:id])
      current_user.organization = @organization
      current_user.save
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organization_params
      params.require(:organization).permit(:name, :gitlab_url, :gitlab_token, :gitlab_folder_id)
    end
end
