


get '/answers' do
  @answers = @question.answers

  erb :'/answers/index'
end
