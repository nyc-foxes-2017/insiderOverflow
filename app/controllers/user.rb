get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  @user = User.find_by(id: params[:id])
  #create logic to show questions & answers
  erb :'/users/show'
end

get '/login' do
  erb :"/users/login"
end

post '/login' do
  user = User.find_by(email: params[:email])
  if user && user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect "/users/#{user.id}"
    else
      @errors = ["Invalid information, try again!!!!"]
      erb :"/users/login"
  end
end

get '/logout' do
  session.clear
  redirect '/questions/index'
end
