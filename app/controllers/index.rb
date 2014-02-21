get '/' do
  # Look in app/views/index.erb
  @decks = Deck.all
  erb :index
  #hello!
end
