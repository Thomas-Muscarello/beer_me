module ApplicationHelper
  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end

  def poster
  current_user == @post.user_id
  end
    
  def redirect_if_not_logged_in
    if !current_user
      redirect_to login_path
    end
  end
    
end
