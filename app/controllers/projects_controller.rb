class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]

  # GET /projects or /projects.json
  def index
    redirect_to root_path unless current_user.admin?

    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
    redirect_to root_path unless current_user.admin?
  end

  # GET /projects/new
  def new
    redirect_to root_path unless current_user.admin?

    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
    redirect_to root_path unless current_user.admin?
  end

  # POST /projects or /projects.json
  def create
    return unless current_user.admin?

    @project = Project.new(project_params)

    respond_to do |format|
      if @project.save
        format.html { redirect_to project_url(@project), notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    return unless current_user.admin?

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to project_url(@project), notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    return unless current_user.admin?

    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:p_number, :p_name, team_ids: [], course_ids: [])
    end
end
