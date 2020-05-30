When we redirect "/users/#{@user.id}" ,this is the actual URL, the HTTP request. Rarely render from a post, patch, or, delete request. Most of the time flash messages are written inside post, patch, or delete requests. Flash messages cannot be used inside routes with an erb :

The Authenticate method takes a password as a plain string and checks it against bcrypt's hashing algorithm. ActiveRecord's password validation ensures it exists.

The environment file in the config folder requires the Gemfile and bundles all the gems in the Gemfile. It also requires the application_controller, along with all the files in the app folder (all MVC related folders). Lastly, it establish_connection with the database.

The config.ru requires the environment file mentioned above, and is where other controllers are mounted on the application controller. This file also establishes some middleware with use Rack::MethodOverride, allowing me to send patch and delete requests. 
