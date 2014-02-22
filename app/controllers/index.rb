get '/' do
  if session[:status]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/log_out' do
  session.clear
  redirect '/'
end


