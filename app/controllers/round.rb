get '/round/card/:card_id' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @card = Card.find(params[:card_id])
    erb :run_card
  end
end

post '/card/answer/:card_id' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @guess = Guess.create(round_id: session[:round_id], card_id: params[:card_id], correct?: params[:answer] == params[:correct])
    session[:previous_answer] = @guess.correct?
    if session[:cards].empty?
      # redirect '/round/stats/'
      erb :run_card
    else
      redirect "/round/card/#{session[:cards].pop.id}"
    end
  end
end

get '/round/stats' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @round = Round.find(session[:round_id])
    session[:previous_answer]=nil
    erb :stats
  end
end

get '/round/:deck_id' do
  if session[:status] != "logged in"
    redirect '/'
  else
    @deck = Deck.find(params[:deck_id])
    @round = Round.create(deck_id: params[:deck_id], user_id: session[:user_id])
    session[:round_id] = @round.id
    session[:cards] = @deck.cards.shuffle
    session[:deck_title] =@deck.title
    # binding.pry
    erb :start_round
  end
end
