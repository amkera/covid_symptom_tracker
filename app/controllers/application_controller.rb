require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
      #redirect to their show page
    else
      erb :welcome
    end
  end

  helpers do
    def logged_in?
      !!current_user
    end
    #converts value to boolean

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    #right side not evaluated if left side returns true

    def redirect_if_not_logged_in
      if !logged_in?
        flash[:errors] = "You must be logged in to continue."
        redirect '/'
      end
    end

  end

end
