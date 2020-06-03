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

View Case
User can only view their own cases. There is some logic ensuring this in the cases/index file.

Update Case
Edit form is rendered only if the user is logged in and the case is found by its id in the params hash. Edit form's action is dynamic: <form class="" action="/cases/<%= @case.id %>" method="POST">
When this is submitted, a PATCH request is sent and then processed by the cases controller. ActiveRecord's update method is called.

Delete Case
This method will not show anything, which is why redirect is needed. This is also a dynamic route: delete '/cases/:id' so that the correct case with the appropriate id is deleted. If the user of the case is the same as the current_user as defined in the helper method, the case can be deleted.



4 VERBS:
GET - "gets" information from the server
POST - "posts" information to the server
PATCH - "updates" existing information
DELETE - "destroys" or "deletes" existing information

7 ROUTES:
INDEX - 'GET', displays ALL user's cases
NEW - 'GET', show the form to create a new case
CREATE - 'POST', create & persist a new case, and redirect
SHOW - 'GET', show info about one particular case
EDIT - 'GET', show the form where user can edit a case
UPDATE - 'PATCH', update a case, and redirect
DESTROY / DELETE - 'DELETE', delete a case and redirect


Questions:
1. What is MVC?
MVC stands for model view controller, and it's a structure that applications use. All folders in this structures communicate with each other and serve a different purpose. Models are responsible for communicating with the database and manipulating data. Views are the front end, what a user sees. And the controller communicates between the two, accepting input from the model and rendering it for the user in the view.

Models will always inherit from ActiveRecord::Base.

Controllers will always inherit from Sinatra::Base

Views are HTML files with embedded Ruby.

Sinatra’s job is to help us receive HTTP requests and send responses. It is configured to easily get data from our Models and use our Views as the body of the response, but the only place where we are actually using Sinatra methods is in the Controller.

2. How do you access views that are defined in the controllers? Through instance variables.

3. Difference between redirecting and erb?
erb actually renders the page and gives the page or the view access to any instance variables in that route in the controller. Redirect also shows a page, but it does not give access to instance variables. It's more indirect.

4. What methods do we get from "belongs_to", "has_many", and "has_secure_password"?
.all, .last, .count, .first which are all methods that Active Record gives to the application when the model inherits from ActiveRecord::Base

5. How do we represent relationships between models in our tables?
FOREIGN KEYS. This application's case model has a foreign key called "user_id" as seen in the migration file, indicating that cases belong to users, and users have many cases. The second part of this relationship is explicitly stating in the models "has_many" and "belongs_to" in the appropriate model classes.

6. What is params?
Params is a hash that Sinatra makes available in the routes, containing user information. The hash has keys that come from the database, specifically the migration file, and the user fills in the values. Params comes from two places -- from the keys that the developer creates in the db, and the values that the user inputs. It includes relevant data from the request.

7. What is sessions?
A cookie is a hash that gets stored in the browser and sent back to the server along with every subsequent request. This is also how we log in and log out users. When a user logs in, their session id is set to the id of the user, essentially logging them in and keeping them logged in. When they log out, the session is cleared and the user is logged out.

8. Describe the flow of the app.
ActiveRecord::Base is connected to the database, and is established in the environment file. ActiveRecord::Migration creates the database along with its appropriate columns based on the column names set in the migration file.

The models connect to the database, and it is in the models and the migration files that relationships are set. The controllers take data from the models and serve it up to the views. When an HTTP request is made, Sinatra handles directing that request to our Controllers where we have use Sinatra::Base methods (get, post, patch, delete) to define routes that receive the HTTP requests.

The user decides what they would like to do on the website, and their decisions trigger requests such as post, get, patch, and delete which correspond to CRUD actions. Inside these routes we use methods provided by ActiveRecord::Base to interact with the database - either querying, inserting, deleting or updating records.

The Controller then sends the information that it got from the Model to the View, where it's rendered with HTML and styled with CSS.

9. How do you authenticate your users when they log in? Verify that the session id == the user.id which is the id from the database.

10. How do you validate that a username is unique? :uniqueness => true

11. Why do I need to check that a resource belongs to the current user in the patch and delete routes? To prevent against other users deleting and editing content that doesn't belong to them

12. Where does the authenticate method come from?
From has_secure_password macro that Active Record gives you.

13. Name some methods from ActiveRecord:
Queries (.all, .count, .last, .first), Data Manipulation (create, update, destroy, new), Relationships (has_many, belongs_to, has_secure_password), and Validations (validates, validates_with, valid?, invalid?)

14. Explain the has_secure_password macro:
It's used in conjunction with the bcrypt gem. Bcrypt encrypts the users password, and has_secure_password will check to see if the unencrypted password matches the encrypted version in the db. It also creates reader and writer methods for #password so that developers don't need to type password_digest.
