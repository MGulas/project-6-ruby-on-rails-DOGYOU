class TeamsController < ApplicationController
  before_action :set_team, only: %i[ show edit update destroy ]

  # GET /teams or /teams.json
  def index
    redirect_to root_path unless current_user&.admin?

    @teams = Team.all
  end

  # GET /teams/1 or /teams/1.json
  def show
    redirect_to root_path unless current_user&.admin?
  end

  # GET /teams/new
  def new
    redirect_to root_path unless current_user&.admin?

    @team = Team.new
  end

  # GET /teams/1/edit
  def edit
    redirect_to root_path unless current_user&.admin?
  end

  # POST /teams or /teams.json
  def create
    return unless current_user&.admin?

    @team = Team.new(team_params)

    respond_to do |format|
      if @team.save
        format.html { redirect_to team_url(@team), notice: "Team was successfully created." }
        format.json { render :show, status: :created, location: @team }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /teams/1 or /teams/1.json
  def update
    return unless current_user&.admin?

    respond_to do |format|
      if @team.update(team_params)
        format.html { redirect_to team_url(@team), notice: "Team was successfully updated." }
        format.json { render :show, status: :ok, location: @team }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1 or /teams/1.json
  def destroy
    return unless current_user&.admin?

    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url, notice: "Team was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
      @team = Team.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def team_params
      params.require(:team).permit(:team_number, :team_name, user_ids: [])
    end
end
