get '/user/login/' do
  @user = User.where(params[:user]).first
  if @user
    session[:status] = "logged in"
    session[:user_id] = @user.id
    redirect '/decks/'
  else
    erb :index
  end
end

post '/user/create/' do
  User.create(params)
  erb :index
end
