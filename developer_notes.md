When we redirect "/users/#{@user.id}" ,this is the actual URL, the HTTP request. Rarely render from a post, patch, or, delete request. Most of the time flash messages are written inside post, patch, or delete requests. Flash messages cannot be used inside routes with an erb :

The Authenticate method takes a password as a plain string and checks it against bcrypt's hashing algorithm. ActiveRecord's password validation ensures it exists.

The environment file in the config folder requires the Gemfile and bundles all the gems in the Gemfile. It also requires the application_controller, along with all the files in the app folder (all MVC related folders). Lastly, it establish_connection with the database.

The config.ru requires the environment file mentioned above, and is where other controllers are mounted on the application controller. This file also establishes some middleware with use Rack::MethodOverride, allowing me to send patch and delete requests.

Users Controller
Logging In
If user can be found by their email, and if their password is legitimate / matches the hashed version of their password, they are logged in. Sets the user_id in the session hash to their id in the params hash. Then they are redirected to the show page, dynamically, based on their id.

Signing Up
Sign up page is rendered, user enters their credentials, post request is sent to /users. New user created temporarily, credentials checked to make sure they are valid. User is then persisted to the db, logged in, and they are sent to user's specific show page, dynamic route based on their user id in the params hash.

Show page
User is taken to their own show or homepage, based on their id in the params hash. Note on rendering: We usually render in get requests. "show" in the url will be replaced with the user's id from the db.

Log Out
Clears the session, essentially logging the user out. Redirects them to the welcome page. 
