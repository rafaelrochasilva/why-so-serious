get '/' do
  @jokes = Joke.all
  erb :index
end

get '/joke/show/:id' do
  @joke = Joke.find(params[:id]) #what do you want to do with this array here, or in page.
  erb :'joke/show'
end

get '/joke/new' do
  erb :'joke/new'
end

post '/joke/new' do
  p "------------------Creating a new joke"
  p params[:joke_title]
  p params[:text_one]
  p params[:text_two]
  p params[:text_three]

  @joke = Joke.create(joke_title: params[:joke_title],
                      text_one: params[:text_one],
                      text_two: params[:text_two],
                      text_three: params[:text_three],
                      )

  @joke.images << Image.where(path: params[:image1]).first_or_create
  @joke.images << Image.where(path: params[:image2]).first_or_create
  @joke.images << Image.where(path: params[:image3]).first_or_create
  
  redirect :"joke/show/#{@joke.id}"
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
