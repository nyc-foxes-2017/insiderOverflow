
before '/question/:id/*' do
  # current_user
  @question = Question.find_by(id: params[:id])
end

get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end


get '/questions/new' do
  # current_user
  erb :'/questions/new_question'
end

get '/questions/:id' do
# should go to the show page
  erb :'/answers'
end


post '/questions' do
  # current_user
  user = user.find(session[:user_id])
  question = user.questions.new(params[:question])
  if question.save
    redirect "/questions/#{user.id}"
  else
    erb :'/questions/new_question'
  end
end
