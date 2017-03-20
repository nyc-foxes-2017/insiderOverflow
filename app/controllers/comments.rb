get "/questions/:q_id/answers/:a_id/comments/new" do
  require_login
  @question = Question.find(params[:q_id])
  @answer = Answer.find(params[:a_id])
  if request.xhr?
    erb :'/comments/new', layout: false
  else
    erb :'/comments/new'
  end
end


post '/questions/:q_id/answers/:a_id' do
  @question = Question.find(params[:q_id])
  @answers = @question.answers
  @answer = Answer.find(params[:a_id])
  @user = User.find(session[:user_id])
  comment = Comment.new(response: params[:comment][:response], user_id: session[:user_id])
  if request.xhr?
    if comment.save
      @answer.comments << comment
      erb :"/partials/_comment", layout: false, locals: {comment: comment}
    else
      @errors = comment.errors.full_messages
      erb :"/comments/new", layout: false
    end
  else
    if comment.save
    @answer.comments << comment
    erb :"/questions/show"
  else
    @errors = comment.errors.full_messages
    erb :"/comments/new"
  end
  end
end
