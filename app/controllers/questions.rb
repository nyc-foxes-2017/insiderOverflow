get '/questions' do
  @questions = Question.order(:created_at)
  erb :'questions/index'
end


get '/questions/new' do
  require_login
  erb :'/questions/new_question', layout: false
end

post '/questions' do
  require_login
  user = User.find(session[:user_id])
  question = user.questions.new(params[:question])
  questions = Question.all

  if request.xhr?
    if question.save
      erb :"/partials/_question", layout: false, locals: {user: user, question: question, questions: questions}
    else
      redirect '/questions'
    end
  else
    if question.save
      redirect "/questions"
    else
      erb :'/questions/new_question'
    end
  end
end

get '/questions/:q_id' do
  @question = Question.find_by(id: params[:q_id])
  @answers = @question.answers
  erb :'/questions/show'
end

get '/questions/:q_id/edit' do
  current_user
  @question = Question.find(params[:q_id])
  erb :'questions/edit'
end

put '/questions/:q_id' do
  require_login
  question = Question.find(params[:q_id])
  question.update_attributes(params[:question])
  if question.save
    redirect "/questions/#{question.id}"
  else
    erb :'questions/edit'
  end
end

delete '/questions/:q_id' do
  require_login && current_user
  question = Question.find(params[:q_id])
  question.destroy
  redirect '/questions'
end
