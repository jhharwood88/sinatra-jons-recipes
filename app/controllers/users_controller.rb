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
	  	@user = User.create(params[:user])
   
    redirect "users/#{@user.id}"

	end

	get '/users/:id' do 
		# displays the user page with their recipes, link to edit/add
		erb :'/users/show'
	end

end
