def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def require_login
  redirect '/login' unless current user
end
