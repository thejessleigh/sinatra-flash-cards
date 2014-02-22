get '/' do
  if session[:status]
    @user = User.where(id: session[:user_id]).first
    unless @user
      session[:status] = nil
      session[:user_id] = nil
    end
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
