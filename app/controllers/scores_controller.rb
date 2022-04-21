class ScoresController < ApplicationController
  before_action :set_score, only: %i[ show edit update destroy ]

  # GET /scores or /scores.json
  def index
    # Depending on current_user, give all comments or only comments involving them.
    if current_user&.admin? then
      @scores = Score.all
    elsif !current_user.nil?
      @scores = Score.where(["creator = :email or recipient = :email", {email: current_user.email_address}])
    else
      redirect_to root_path
    end
    # if p param exists, only give comments with that project_id
    @scores = @scores.where(project_id: params[:p]) if params[:p]
  end

  # GET /scores/1 or /scores/1.json
  def show
    redirect_to root_path unless current_user&.admin? || current_user&.email_address == @comment.creator
  end

  # GET /scores/new
  def new
    redirect_to root_path if current_user.nil?

    @score = Score.new
    # params for project_id and recipient so form autofills for new scores
    @score.project_id = params[:project_id] if params[:project_id]
    @score.recipient = params[:recipient] if params[:recipient]
  end

  # GET /scores/1/edit
  def edit
    redirect_to root_path unless current_user&.admin? || current_user&.email_address == @comment.creator
  end

  # POST /scores or /scores.json
  def create
    return if current_user.nil?

    @score = Score.new(score_params)

    respond_to do |format|
      if @score.save
        format.html { redirect_to score_url(@score), notice: "Score was successfully created." }
        format.json { render :show, status: :created, location: @score }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scores/1 or /scores/1.json
  def update
    return unless current_user&.admin? || current_user&.email_address == @comment.creator

    respond_to do |format|
      if @score.update(score_params)
        format.html { redirect_to score_url(@score), notice: "Score was successfully updated." }
        format.json { render :show, status: :ok, location: @score }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @score.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scores/1 or /scores/1.json
  def destroy
    return unless current_user&.admin? || current_user&.email_address == @comment.creator

    @score.destroy

    respond_to do |format|
      format.html { redirect_to scores_url, notice: "Score was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_score
      @score = Score.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def score_params
      params.require(:score).permit(:creator, :recipient, :project_id, :score)
    end
end
