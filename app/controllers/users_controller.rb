class UsersController < ApplicationController

  get '/login' do
    erb :login #render the login form/page
  end

  post '/login' do
    #action = login, method = POST.
    #creating a session. receive login form.
    #params looks like this:
      #{"email" => "some_user", "password" => "their_password"}
  end



end
