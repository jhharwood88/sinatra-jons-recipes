class UsersController < ApplicationController

	get '/' do 
		# login/out or create a new user, homepage
		erb :'/users/index'
	end

	get '/users/login' do 
		# gives user login form
		erb :'/users/login'
	end

	get '/users/new' do
    # load the new user form
    	erb :'/users/new'
	end

	post '/users' do
	  # receive the params from the form submission and create a new user
	  	
	  	@user = User.new(:username => params[:username],:password => params[:password])

   		if @user.username != "" && @user.password_digest != ""
   			@user.save
   			redirect "/users/#{@user.id}"
   		else
   			redirect "/users/failure"
   		end

	end

	get '/users/:id' do 
		# displays the user page with their recipes, link to edit/add
		 @user = User.find(params[:id])
		erb :'/users/show'
	end

end
