get '/' do
  @jokes = Joke.all.reverse
  erb :index
end
