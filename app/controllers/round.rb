get '/round/:deck_id' do
  @deck = Deck.find(params[:deck_id])
  @cards = @deck.cards.shuffle
  erb :start_round
end

get '/round/card/:card_id ' do
  @card = Card.find(params[:card_id])
  erb :run_card
end

get '/card/answer/' do
  @guess = Guess.create
end


