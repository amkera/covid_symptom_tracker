class CasesController < ApplicationController
  #render the form to create a new entry
  get '/cases/new' do
    erb :'/cases/new'
  end

  post '/cases' do #CREATE a new case and save it to the database
    #raise params.inspect
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

  get '/cases/:id' do
    #raise params.inspect
    #show/render a specific case, to have access to this instance variable.
    @case = Case.find(params[:id])
    erb :'/cases/show'
  end

  get '/cases/:id/edit' do #take user to cases/edit.erb & render edit form
    erb :'/cases/edit'
  end 



end
