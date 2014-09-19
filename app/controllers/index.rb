get '/' do
  @jokes = Joke.all
  erb :index
end

get '/joke/show/:id' do
  joke = Joke.find(params[:id]) #what do you want to do with this array here, or in page.
  erb :'joke/show'
end

get '/joke/new' do
  erb :'joke/new'
end

post '/joke/new' do
  @joke = Joke.create(params[:joke])
  @joke.images << Image.where(path: params[:image]).first_or_create
  # @joke << Image.where(path: params[:image2]).first_or_create
  # @joke << Image.where(path: params[:image3]).first_or_create
  redirect "/joke/show/#{@joke.id}"
end

get '/create_joker' do
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
