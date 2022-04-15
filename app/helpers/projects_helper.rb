module ProjectsHelper
  def authenticate!
    if !admin?
        redirect_to '/', :notice => 'User not authorized to view this page'
    end
  end
end
