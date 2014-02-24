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
end

post '/decks/add_card' do
  @card = Card.new(params[:card])
  @deck = Deck.find(params[:card][:deck_id])
  @deck.cards << @card
  @deck_id = @deck.id
  @has_card = true
  erb :add_card
end

get '/decks/create' do
  @user_id = session[:user_id]
  erb :create_deck
end

get '/decks/edit' do
  @decks = Deck.where(user_id: session[:user_id])
  erb :decks_to_edit
end

get '/decks/delete/:deck_id' do
  Deck.find(params[:deck_id]).destroy
  @decks = Deck.where(user_id: session[:user_id])
  if @decks.empty?
    erb :decks, layout: !request.xhr?
  else
    erb :decks_to_edit, layout: !request.xhr?
  end
end

get '/decks/edit/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  erb :edit_deck, layout: !request.xhr?
end

post '/decks/create' do
  @deck = Deck.create(params[:deck])
  if @deck.id
    redirect "decks/add_card/#{@deck.id}"
  else
    @user_id = params[:deck][:user_id]
    @message = "Deck title #{@deck.title} is not available."
    erb :create_deck
  end
end
