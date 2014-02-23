
get '/user/login' do
  puts params
  @user = User.find_by(user_name: params["user"]["user_name"])
  # binding.pry
  if @user && @user.password == params["user"]["password"]
    session[:status] = "logged in"
    session[:user_id] = @user.id
    redirect '/decks'
  else
    redirect "/"
  end
end

post '/user/create' do
  @user = User.create(user_name: params["user"]["user_name"], password_hash: BCrypt::Password.create(params["user"]["password"]))
  session[:user_id] = @user.id
  erb :index
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

get '/user/decks' do
  @decks = Deck.where(user_id: session[:user_id])
  if @decks.empty?
    @decks = Deck.all
    @message = "You don't have any decks!!!<br><br>Here are some other people's decks."
  else
    @my_decks = true
  end
  erb :decks
end



