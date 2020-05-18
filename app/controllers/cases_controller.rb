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
      binding.pry

      if (params[:cough].to_i.between?(1,10) && params[:difficulty_breathing].to_i.between?(1,10) && params[:fever].to_i.between?(1,10) && params[:chills].to_i.between?(1,10) && params[:muscle_pain].to_i.between?(1,10) && params[:sore_throat].to_i.between?(1,10) && params[:smell_or_taste_loss].to_i.between?(1,10))
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
    @case = Case.find(params[:id])
    erb :'/cases/edit'
  end

  patch '/cases/:id' do
    "Hello"
  end



end
