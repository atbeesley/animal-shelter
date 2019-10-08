require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/customer')
also_reload('../models/*')

get '/animals' do
  @animals = Animal.all
  erb(:index)
end

get '/animals/new' do
  @customers = Customer.all
  erb(:new)
end

post '/animals' do
  Animal.new(params).save
  redirect to '/animals'
end

get '/animals/:id' do
  @animals = Animal.find(params['id'])
  erb(:show)
end

get '/animals/:id/edit' do
  @customers = Customer.all
  @animal = Animal.find(params['id'])
  erb(:edit)
end

post '/animals/:id' do
  animal = Animal.new(params)
  animal.update
  redirect to "/animals/#{params['id']}"
end

post '/animals/:id/delete' do
  animal = Animal.find(params['id'])
  animal.delete
  redirect to '/animals'
end
