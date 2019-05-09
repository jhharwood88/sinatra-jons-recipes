class UsersController < ApplicationController

	get '/' do 
		
		if session[:user_id]
			@current_user = session[:username]
			@user_id = session[:user_id]
		else
			@current_user = "Please log in"
		end
		# login/out or create a new user, homepage
		erb :'users/index'
	end

	

	get '/users/new' do
    # load the new user form
    	erb :'users/new'
	end

	
	post '/users' do
	  # receive the params from the form submission and create a new user
	  	
	  	@user = User.new(:username => params[:username],:password => params[:password])
	  	
   		if @user.username == "" || @user.password_digest == nil
   			redirect "/users/create_failure"
   		else
   			@user.save
   			redirect "/users/login"
   		end

	end

	get '/users/create_failure' do 
		erb :'users/create_failure'
	end

	get '/users/login' do 
		
		# gives user login form
		erb :'users/login'
	end

	get '/users/logout' do
		session.clear
		erb :'users/logout'
	end

	get '/users/failure' do 
		erb :'users/failure'
	end


	get '/users/:id' do 
		# displays the user page with their recipes, link to edit/add
		 @user = User.find(params[:id])
		 @user_recipes = []
		 @all_recipes = Recipe.all

		 @all_recipes.each do |recipe|
		 	if recipe.user_id == session[:user_id]
		 		@user_recipes << recipe 
		 	end
		 end
		 
		erb :'users/show'
	end

	post '/users/login' do 
		@user = User.find_by(:username => params["username"])
		

		if @user && @user.authenticate(params[:password])
		    session[:user_id] = @user.id
		    session[:username] = @user.username
		    redirect "/users/#{@user.id}"
	  	else
		    redirect "/users/failure"
	  	end
		

	end

end
