get '/' do
  @jokes = Joke.all
  erb :index
end

