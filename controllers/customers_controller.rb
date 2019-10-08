require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/animal')
require_relative('../models/customer')
also_reload('../models/*')

get '/customers' do
  @customers = Customer.all
  erb(:index)
end

get '/customers/new' do
  @customers = Customer.all
  erb(:new)
end

post '/customers' do
  Customer.new(params).save
  redirect to '/customers'
end

get '/customers/:id' do
  @customer = Customer.find(params['id'])
  erb(:show)
end

get '/customers/:id/edit' do
  @animals = Animal.all
  @customer = Customer.find(params['id'])
  erb(:edit)
end

post '/customers/:id' do
  customer = Customer.new(params)
  customer.update
  redirect to "/customers/#{params['id']}"
end

post '/customers/:id/delete' do
  customer = Customer.find(params['id'])
  customer.delete
  redirect to '/customers'
end
