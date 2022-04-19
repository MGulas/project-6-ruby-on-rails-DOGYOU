class AdminController < ApplicationController
  def index
    redirect_to root_path unless current_user.admin?
  end

  def add_user_to_team
    user = User.find_by(email_address: params[:email_address].downcase)
    team = Team.find_by (params[:team_number])
    if user && team
      # add to team
      user.teams << team
      redirect_to admin_url
    else
      # create error message
      flash.now[:danger] = 'Invalid user or team'
      render 'index'
    end
  end

  def add_user_to_section
    user = User.find_by(email_address: params[:email_address].downcase)
    section = Course.find(params[:course_id])
    if user && section
      # add to section
      user.courses << section
      redirect_to admin_url
    else
      # create error message
      flash.now[:danger] = 'Invalid user or section'
      render 'index'
    end
  end
end
