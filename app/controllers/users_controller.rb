class UsersController < ApplicationController

  get '/login' do
    erb :login #render the login form/page
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "users/#{@user.id}"
    end
  end

  get '/signup' do #render the signup form
    erb :signup
    #because signup is toplevel file inside views, don't need to do '/'
  end

  post '/users' do
    #create a new user and persist them to db if valid input
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(params)
      redirect "/users/#{@user.id}"
      #this is the actual URL, the HTTP request. Rarely render from a post, patch, or delete request.
    end
  end 

  get '/users/:id' do
    erb :"/users/show"
    #we usually render in get requests
  end


end
