get '/' do
  if session[:status]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/decks' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @decks = Deck.all
    erb :decks
  end
end
