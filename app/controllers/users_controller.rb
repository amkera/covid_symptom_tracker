class UsersController < ApplicationController
  #render the login page
  get '/login' do
    erb :'/users/login'
  end

  post '/login' do
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      #if @user is true and exists
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.name}."
      redirect "/users/#{@user.id}"
      #the show page
    else
      flash[:errors] = "Invalid credentials! Please sign up, or try again."
      redirect '/login'
    end
  end

  get '/signup' do
    erb :'/users/signup'
  end

  post '/users' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:user_id] = @user.id
      flash[:message] = "Welcome, #{@user.name}. You have successfully created an account."
      redirect "/users/#{@user.id}"
    else
      flash[:errors] = "Account was not successfully created. #{@user.errors.full_messages.to_sentence}."
      redirect '/signup'
    end
  end


  get '/users/:id' do
    @user = User.find_by(id: params[:id])
    redirect_if_not_logged_in
    erb :'/users/show'
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
