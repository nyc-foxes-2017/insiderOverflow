get '/questions/:q_id/answers/new' do
  require_login

  @question = Question.find(params[:q_id])
  erb :'/answers/new'
end

post '/questions/:q_id' do
  require_login
  @question = Question.find_by(id: params[:q_id])
  @answers = @question.answers
  @answer = @question.answers.new(response: params[:answer][:response], user_id: session[:user_id])
  if @answer.save
    erb :'/questions/show'
  else
    erb :'/answers/new'
  end
end

post '/questions/:q_id/answers/:a_id/vote' do
  @question = Question.find(params[:q_id])
  answer = Answer.find(params[:a_id])
  answer.votes.create(value: 1, user_id: session[:user_id])
  redirect "/questions/#{@question.id}"
end

post '/questions/:q_id/answers/:a_id/downvote' do
  @question = Question.find(params[:q_id])
  answer = Answer.find(params[:a_id])
  answer.votes.create(value: -1, user_id: session[:user_id])
  redirect "/questions/#{@question.id}"
end


delete '/questions/:q_id/answers/:a_id' do
  require_login && current_user
  answer = Answer.find(params[:a_id])
  question = answer.question_id
  answer.destroy
  redirect "/questions/#{question}"
end
