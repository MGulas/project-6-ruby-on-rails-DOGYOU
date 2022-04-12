class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email_address: params[:session][:email_address].downcase)
    if user
      # log in 
      log_in user
      redirect_to user
    else
      # create error message
      flash.now[:danger] = 'Invalid email address'
      render 'new'
    end
  end

  def destroy
  end
end
