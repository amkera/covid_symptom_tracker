class UsersController < ApplicationController

  get '/login' do
    erb :login #render the login form/page
  end

  post '/login' do
    #action = login, method = POST. creating a session. receive login form.
    #params looks like this:
      #{"email" => "some_user", "password" => "their_password"}
    #find the user
    @user = User.find_by(email: params[:email])
    #authenticate
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect 'users/#{@user.id}'
    else

    end

  end

  get '/signup' do
  end

  get '/users/:id' do
    'testing'
  end



end
