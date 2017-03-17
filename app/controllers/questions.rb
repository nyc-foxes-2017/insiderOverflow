get '/questions' do
  @questions = Question.all
  erb :'questions/index'
end


get '/questions/new' do
  require_login
  erb :'/questions/new_question'
end

post '/questions' do
  require_login
  user = User.find(session[:user_id])
  question = user.questions.new(params[:question])
  if question.save
    redirect "/questions/#{question.id}"
  else
    erb :'/questions/new_question'
  end
end

get '/questions/:id' do
  @question = Question.find_by(id: params[:id])
  @answers = @question.answers
  erb :'/questions/show'
end

get '/questions/:id/edit' do
  current_user
  @question = Question.find(params[:id])
  erb :'questions/edit'
end

put '/questions/:id' do
  require_login
  question = Question.find(params[:id])
  question.update_attributes(params[:question])
  if question.save
    redirect "/questions/#{question.id}"
  else
    erb :'questions/edit'
  end
end

delete '/questions/:id' do
  require_login && current_user
  question = Question.find(params[:id])
  question.destroy
  redirect '/questions'
end
