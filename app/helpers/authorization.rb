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
  #for questions ONLY
  current_user.id == Question.find_by(id: params[:q_id]).user_id
end

def owner_answer?
  current_user.id == Answer.find_by(id: params[:a_id]).user_id
end

def owner_response?

end

def voted?(user)
  self.points.find_by(id: user.id) ? true : false
end
