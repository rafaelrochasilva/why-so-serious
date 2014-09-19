get '/' do
  @jokes = Joke.all
  erb :index
end

get '/create_joker' do



