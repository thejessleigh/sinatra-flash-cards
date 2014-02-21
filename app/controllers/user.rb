post '/user/login/' do
  if user authenticated
end

post '/user/create' do
  User.create(params)
  erb :index
end
