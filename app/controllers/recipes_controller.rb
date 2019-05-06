class RecipesController < ApplicationController
  get '/recipes/index' do 
  	# list all the available recipes to choose from
  end

  get '/recipes/:id' do 
  	# display particular recipe/ link to edit / link to delete
  end

  get '/recipes/new' do
    # load the new recipe form
  end

  post '/recipes' do
    # receive the params from the form submission and create a new recipe
  end

  get '/recipes/:id/edit' do 
  	# load the edit form / load button for recipe deletion
  end

  patch '/recipes/:id/edit' do 
  	# update the given recipe / check to make sure forms arent left blank
  end

  delete '/recipes/:id/edit' do 
  	# remove the selected recipe from the DB
  end

end
