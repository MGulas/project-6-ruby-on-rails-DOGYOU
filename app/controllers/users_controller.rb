class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    redirect_to root_path unless current_user&.admin?

    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    redirect_to root_path unless current_user&.admin? || current_user == @user

    @user = User.find(params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    redirect_to root_path unless current_user&.admin? || current_user == @user
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        log_in @user
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    return unless current_user&.admin? || current_user == @user

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    return unless current_user&.admin? || current_user == @user

    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def add_user_to_section
    begin
      @user = User.find_by(email_address: current_user.email_address.downcase)
      @course = Course.find_by(course_id: params[:course_id])
      if @user && @course
        if @user.courses.include?(@course)
          flash.now[:danger] = 'User is already in this section'
          render 'mysections'
        else 
          @user.courses << @course
          flash.now[:notice] = "User was successfully added to section"
          render 'mysections'
        end
      else
        flash.now[:danger] = 'Invalid user or section'
        render 'mysections'
      end
    rescue => e
      flash.now[:danger] = 'Invalid user or section'
      render 'mysections'
    end
  end

  def has_projects?
    check = false
    current_user.teams.each do |team|
        if team.projects.size > 0
            check = true
        end
    end
    check
  end
  helper_method :has_projects?

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email_address, :first_name, :last_name, :admin, :password, :password_confirmation, course_ids: [])
    end
end
