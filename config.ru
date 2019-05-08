require './config/environment'

# add necessary middleware
use Rack::MethodOverride
run ApplicationController
use UsersController
use RecipesController



