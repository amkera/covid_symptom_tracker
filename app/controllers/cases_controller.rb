class CasesController < ApplicationController
  #render the form to create a new entry
  get '/cases/new' do
    erb :'/cases/new'
  end

  post '/cases' do
  end

end
