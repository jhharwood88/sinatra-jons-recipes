require './config/environment'

# add necessary middleware

run ApplicationController
use UsersController
use RecipesController
use Rack::MethodOverride



