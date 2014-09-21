get '/joke/show/:id' do
  @joke = Joke.find(params[:id])
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

get '/joke/:id/edit' do
  @joke = Joke.find(params[:id])
  erb :'joke/edit'
end

put '/joke/:id/edit' do
  joke = Joke.find(params[:id])
  joke.update(joke_title: params[:joke_title],
                            text_one: params[:text_one],
                            text_two: params[:text_two],
                            text_three: params[:text_three],
                            )

  joke.images.find_or_create_by(path: params[:image1])
  joke.images.find_or_create_by(path: params[:image2])
  joke.images.find_or_create_by(path: params[:image3])
  
  redirect :"joke/show/#{joke.id}"
end

delete "/joke/:id" do
  Joke.find(params[:id]).destroy
  redirect "/"  
end