class CasesController < ApplicationController
  #render the form to create a new entry

  get '/cases' do
    if logged_in?
      @cases = Case.all
      erb :'/cases/index'
    else
      redirect '/'
    end
  end

  get '/cases/new' do
    if logged_in?
      erb :'/cases/new'
    else
      redirect '/'
    end
  end

  post '/cases' do #CREATE a new case and save it to the database
    redirect_if_not_logged_in
    if (params[:cough].to_i.between?(1,10) && params[:difficulty_breathing].to_i.between?(1,10) && params[:fever].to_i.between?(1,10) && params[:chills].to_i.between?(1,10) && params[:muscle_pain].to_i.between?(1,10) && params[:sore_throat].to_i.between?(1,10) && params[:smell_or_taste_loss].to_i.between?(1,10))
      flash[:message] = "Your case has been successfully created."
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
      flash[:errors] = "Something went wrong! Please rate your symptoms on a scale from 1-10, inclusive. Any decimals will be rounded down."
      redirect '/cases/new'
    end
  end

  get '/cases/:id' do #show/render a specific case
    set_case
    erb :'/cases/show'
  end

  get '/cases/:id/edit' do #take user to cases/edit.erb & render edit form
    set_case
    redirect_if_not_logged_in
    if @case.user == current_user
      erb :'/cases/edit'
    else
      redirect "/users#{current_user.id}"
      #redirect to user show page
    end
  end

  patch '/cases/:id' do
    set_case
    redirect_if_not_logged_in
    if
      @case.update(cough: params[:cough],
        difficulty_breathing: params[:difficulty_breathing],
        fever: params[:fever],
        chills: params[:chills],
        muscle_pain: params[:muscle_pain],
        sore_throat: params[:sore_throat],
        smell_or_taste_loss: params[:smell_or_taste_loss])
      redirect "/cases/#{@case.id}"
      #show the case that was just edited
    else
      redirect "/users/#{current_user.id}"
      #redirect to user show page
    end
  end

  delete '/cases/:id' do
    set_case
    if @case.user == current_user
      @case.destroy
      flash[:message] = "Case has been successfully deleted."
      redirect '/cases'
    else
      redirect '/cases'
    end
  end


  private
  def set_case
    @case = Case.find(params[:id])
    #helper method that finds the case based on its id in the params
  end



end
