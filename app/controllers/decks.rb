get '/decks' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @decks = Deck.all
    erb :decks
  end
end

get '/decks/add_card/:deck_id' do
  @deck_id=params[:deck_id]
  erb :add_card

  #add additional field in form to store deck_id
end

post '/decks/add_card' do
  @card = Card.new(params[:card])
  "card created"
  #add links on view for add another card and view user profile
  #create a confirmation view
end

get '/decks/create' do
  @user_id = session[:user_id]
  erb :create_deck
end

post '/decks/create' do
   @deck = Deck.create(params[:deck])
   # binding.pry
   redirect "decks/add_card/#{@deck.id}"
end
