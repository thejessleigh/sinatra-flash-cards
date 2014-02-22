
get '/user/login' do
  puts params
  @user = User.find_by(user_name: params["user"]["user_name"])
  if @user.password == params["user"]["password"]
    session[:status] = "logged in"
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect "/"
  end

end

post '/user/create' do
  @user = User.create(user_name: params["user"]["user_name"], password_hash: BCrypt::Password.create(params["user"]["password"]))
  erb :index

  @user.password == params["user"]["password"]
    session[:status] = "logged in"
    session[:user_id] = @user.id
    redirect '/decks'

end

get '/user/create' do
  erb :sign_up
end

get '/user/logout' do
  session[:status] = nil
  session[:user_id] = nil
  redirect '/'
end

get '/user/profile' do
  @user = User.find(session[:user_id])
  erb :user_profile
end


