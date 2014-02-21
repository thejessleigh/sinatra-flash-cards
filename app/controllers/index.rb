get '/' do
  # Look in app/views/index.erb

  erb :index
end

get '/decks/' do
  if session[:status] == "logged in"
    @decks = Deck.all
    erb :decks
  else
    redirect "/"
  end
end
