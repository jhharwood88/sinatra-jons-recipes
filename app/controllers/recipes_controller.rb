class RecipesController < ApplicationController
  
  get '/recipes/new' do
   
    # load the new recipe form
     erb :'recipes/new'
  end

  get '/recipes/edit' do 
     erb :'recipes/edit'
  end

  get '/recipes/:id' do
    @all_recipes = Recipe.all
    @user_id = session[:user_id]
    erb :'recipes/show'
  end


  post '/recipes' do
    # receive the params from the form submission and create a new recipe

    @recipe = Recipe.new(:name => params[:name],:ingredients => params[:ingredients],:procedures => params[:procedures],:user_id => session[:user_id])
     
    if @recipe.save
      redirect "/recipes/#{@recipe.id}"
    else
      @error_message = @recipe.errors.full_messages 

      redirect '/recipes/new'
    end

    
  end

  

  patch '/recipes/:id' do 
  	# update the given recipe / check to make sure forms arent left blank
  end

  delete '/recipes/:id' do 
  	# remove the selected recipe from the DB
  end

end
