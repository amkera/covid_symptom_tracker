class UsersController < ApplicationController

  get '/login' do
    erb :login #render the login form/page
  end


end
