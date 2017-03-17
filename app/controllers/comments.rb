get "/questions/:q_id/answers/:a_id/comments/new" do
  @question = Question.find(params[:q_id])
  @answer = Answer.find(params[:a_id])
  erb :'/comments/new'
end


post '/questions/:q_id/answers/:a_id' do
  @question = Question.find(params[:q_id])
  @answers = @question.answers
  @answer = Answer.find(params[:a_id])
  comment = Comment.new(response: params[:comment][:response])

  if comment.save
    @answer.comments << comment
    erb :"/questions/show"
  else
    erb :"/comments/new"
  end
end
