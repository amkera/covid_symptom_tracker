class UsersController < ApplicationController

  get '/login' do
    erb :login #render the login form/page
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    end
  end

  get '/signup' do #render the signup form
    erb :signup
  end


  post '/users' do
    #create a new user and persist them to db if valid input
    if params[:name] != "" && params[:email] != "" && params[:password] != ""
      @user = User.create(name: params[:name], email: params[:email], password: params[:password])
      if @user.save
        session[:user_id] = @user.id #logs user in once they create a profile
        redirect "/users/#{@user.id}"
      #this is the actual URL, the HTTP request. Rarely render from a post, patch, or delete request.
      else
        redirect '/signup'
      end
    else
      redirect '/signup'
    end
      #stretch feature: include message telling user they entered bad data
  end

  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    erb :'/users/show'
    #we usually render in get requests
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
