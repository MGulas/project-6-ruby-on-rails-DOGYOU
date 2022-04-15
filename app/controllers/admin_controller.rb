class AdminController < ApplicationController
  def index
  end

  def add_user_to_team
    user = User.find_by(email_address: params[:email_address].downcase)
    team = Team.find_by (params[:team_number])
    if user && team
      # add to team
      add_to_team(user, team)
      redirect_to admin_url
    else
      # create error message
      flash.now[:danger] = 'Invalid user or team'
      render 'index'
    end
  end
end
