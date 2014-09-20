get '/' do
  @jokes = Joke.all.reverse
  erb :index
end

get '/joke/show/:id' do
  @joke = Joke.find(params[:id]) #what do you want to do with this array here, or in page.
  erb :'joke/show'
end

get '/joke/new' do
  if session[:joker_id]
    erb :'joke/new'
  else
    erb :login
  end
end

post '/joke/new' do
  joker = Joker.find(session[:joker_id])
  joke = joker.jokes.create(joke_title: params[:joke_title],
                      text_one: params[:text_one],
                      text_two: params[:text_two],
                      text_three: params[:text_three],
                      )

  joke.images.find_or_create_by(path: params[:image1])
  joke.images.find_or_create_by(path: params[:image2])
  joke.images.find_or_create_by(path: params[:image3])
  
  redirect :"joke/show/#{joke.id}"
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
