get '/questions/:id/answers/new' do
  @question = Question.find(params[:id])
  erb :'/answers/new'
end

post '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answers = @question.answers
  @answer = @question.answers.new(response: params[:answer][:response], user_id: @question.user_id)
  if @answer.save
    erb :'/questions/show'
  else
    erb :'/answers/new'
  end
end


delete '/questions/:id/answers/:id' do
  answer = Answer.find(params[:id])
  question = answer.question_id
  answer.destroy
  redirect "/questions/#{question}"
end
