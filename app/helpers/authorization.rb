def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def require_login
  redirect '/login' unless current_user
end

def login?
  !!@current_user
end

def owner?
  current_user.id == Question.find_by(id: params[:id]).user_id
end

def voted?(user)
  self.points.find_by(id: user.id) ? true : false
end
