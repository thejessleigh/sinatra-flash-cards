get '/user/login/' do
  puts params
  @user = User.find_by(user_name: params["user"]["user_name"])
  if @user.password == params["user"]["password"]
    session[:status] = "logged in"
    session[:user_id] = @user.id
    redirect '/decks/'
  else
    redirect "/"
  end



end

post '/user/create/' do
  User.create(params)
  erb :index
end
