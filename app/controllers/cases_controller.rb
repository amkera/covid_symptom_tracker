class CasesController < ApplicationController
  #render the form to create a new entry
  get '/cases/new' do
    erb :'/cases/new'
  end

  post '/cases' do
    #raise params.inspect
    #create a new case and save it to the database
      #only if all symptoms are accounted for
      #and if a user is logged in
      if !logged_in?
        redirect '/'
      end

      if (params[:cough] != "" && params[:difficulty_breathing] != "" && params[:fever] != "" && params[:chills] != "" && params[:muscle_pain] != "" && params[:sore_throat] != "" && params[:smell_or_taste_loss] != "")
        @case = Case.create(
          cough: params[:cough],
          difficulty_breathing: params[:difficulty_breathing],
          fever: params[:fever],
          chills: params[:chills],
          muscle_pain: params[:muscle_pain],
          sore_throat: params[:sore_throat],
          smell_or_taste_loss: params[:smell_or_taste_loss],
          user_id: current_user.id
          )
          redirect "/cases/#{@case.id}"
      else
        redirect '/cases/new'
      end
  end
end
