get '/' do
  @jokes = Joke.all
  erb :index
end

get '/create_joker' do
end

get '/joke/new' do
  erb :'joke/new'
end




