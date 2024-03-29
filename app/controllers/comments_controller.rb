class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    # Depending on current_user, give all comments or only comments involving them.
    if current_user&.admin? then
      @comments = Comment.all
    elsif !current_user.nil?
      @comments = Comment.where(["creator = :email or recipient = :email", {email: current_user.email_address}])
    else
      redirect_to root_path
    end
    # if p param exists, only give comments with that project_id
    @comments = @comments.where(project_id: params[:p]) if params[:p]
  end

  # GET /comments/1 or /comments/1.json
  def show
    redirect_to root_path unless current_user&.admin? || current_user&.email_address == @comment.creator
  end

  # GET /comments/new
  def new
    redirect_to root_path if current_user.nil?
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
    redirect_to root_path unless current_user&.admin? || current_user&.email_address == @comment.creator
  end

  # POST /comments or /comments.json
  def create
    return if current_user.nil?

    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    return unless current_user&.admin? || current_user&.email_address == @comment.creator

    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to comment_url(@comment), notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    return unless current_user&.admin? || current_user&.email_address == @comment.creator

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:creator, :recipient, :project_id, :comment)
    end
end
