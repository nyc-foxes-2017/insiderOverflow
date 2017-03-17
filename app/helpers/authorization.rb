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
  user.votes == 1 ? true : false
end

def vote_happpend?
  voted = @answer.votes.find do |vote|
    vote.user_id == session[:user_id]
  end
  voted ? true : false
end
