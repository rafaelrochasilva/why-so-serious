get '/' do
  @jokes = Joke.all
  erb :index
end

get '/joke/show/:id' do
  joke = Joke.find(params[:id]) #what do you want to do with this array here, or in page.
  erb :'joke/show'
end



get '/create_joker' do
end

get '/joke/new' do
  erb :'joke/new'
end


  erb :create_joker
end

post '/create_joker' do
  joker = Joker.create(params[:joker])
  session[:joker_id] = joker.id
  redirect '/'
end

get '/login' do

  erb :login
end

post '/login' do
  joker = Joker.authenticate(params[:joker])
  session[:joker_id] = joker.id
  redirect '/'
end

get '/logout' do
  session.clear
  redirect '/'
end
