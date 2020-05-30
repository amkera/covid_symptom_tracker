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



Cases controller
get /cases shows the user all their cases only if they are logged in.

New Case
The new case form is rendered only if the user is logged in. The new case form has name values that correspond to the keys in the params hash. Here, the user is actually filling out the values that correspond to the keys in the params hash. This sends a POST request to cases.

The post request processes the data the user entered. It checks the data is entered correctly, it instantiates a new case, and redirects them to the cases/show page where user can see the case they just created. The next method is a get request that renders the page where a user can see the case they just created. The id becomes part of the url.

Update Case
Edit form is rendered only if the user is logged in and the case is found by its id in the params hash. Edit form's action is dynamic: <form class="" action="/cases/<%= @case.id %>" method="POST">
When this is submitted, a PATCH request is sent and then processed by the cases controller. ActiveRecord's update method is called.

Delete Case
This method will not show anything, which is why redirect is needed. This is also a dynamic route: delete '/cases/:id' so that the correct case with the appropriate id is deleted. If the user of the case is the same as the current_user as defined in the helper method, the case can be deleted.
