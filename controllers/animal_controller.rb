require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')

get '/animals' do
  @animals = Animal.all()
erb(:"animals/index")
end

get '/animals/:id' do
  @victim = Animal.find(params['id'].to_i)
  erb( :"Animals/show" )
end
