class RecipesController < ApplicationController
  
  get '/recipes/new' do
   
    # load the new recipe form
     erb :'recipes/new'
  end

  get '/recipes/:id/edit' do
     @recipe_id = params[:id].to_i
     @user_id = session[:user_id]
     @recipe = Recipe.find_by_id(params["id"])
        if @recipe
          binding.pry
            erb :'recipes/edit'
        else

            redirect "/recipes/<%= @recipe_id %>"
        end
     
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params["id"])
    @all_recipes = Recipe.all
    # @recipe_id = params[:id].to_i
    @selected_recipe = []
    @user_id = session[:user_id]
    @all_recipes.each do |recipe|
      if recipe.id == @recipe.id
        @selected_recipe << recipe
        
      end
    end
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
    @recipe = Recipe.find_by_id(params["id"])
        
        if @recipe.update(name: params["name"], ingredients: params["ingredients"], procedures: params["procedures"])
            redirect "/recipes/#{@recipe.id}"
        else
            erb :"/recipes/edit"
        end 
  	
  end

  delete '/recipes/:id' do 
  	@recipe = Recipe.find_by_id(params["id"])
    @user_id = session[:user_id]
      if @recipe.destroy
         redirect "/users/#{@user_id}"
      else
         redirect "/recipes/#{@recipe.id}"
     end
  end

end
