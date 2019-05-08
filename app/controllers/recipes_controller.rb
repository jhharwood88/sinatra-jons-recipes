class RecipesController < ApplicationController
  
  get '/recipes/:id' do
    @all_recipes = Recipe.all
    @user_id = session[:user_id]
    erb :'/recipes/show'
  end

  get '/recipes/new' do
    # load the new recipe form
     erb :'/recipes/new'
  end

  post '/recipes' do
    # receive the params from the form submission and create a new recipe
  end

  get '/recipes/edit' do 
  	 erb :'/recipes/edit'
  end

  patch '/recipes/:id' do 
  	# update the given recipe / check to make sure forms arent left blank
  end

  delete '/recipes/:id' do 
  	# remove the selected recipe from the DB
  end

end
