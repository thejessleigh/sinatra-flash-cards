get '/' do
  erb :index
end

get '/decks/' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @decks = Deck.all
    erb :decks
  end
end
