require_relative('models/animal.rb')
require_relative('models/customer.rb')

require('pry-byebug')

Animal.delete_all()
Customer.delete_all()

animal1 = Animal.new({
  'name' => 'Theresa',
  'species' => 'tauntaun'
   })

animal1.save()

animal2 = Animal.new({
  'name' => 'Betty',
  'species' => 'bantha'
  })

animal2.save()


animal3 = Animal.new({
    'name' => 'Percy',
    'species' => 'porg'
    })

animal3.save()

animal4 = Animal.new({
  'name' => 'Ryan',
  'species' => 'Rancor'
  })

animal4.save()

customer1 = Customer.new({
  'name' => 'Obi-Wan Kenobi',
  'age' => 65,
  'profession' => 'Jedi knight',
  })

customer1.save()

customer2 = Customer.new({
  'name' => 'Princess Leia',
  'age' => 17,
  'profession' => 'diplomat'
  })

customer2.save()

customer3 = Customer.new({
  'name' => 'Luke Skywalker',
  'age' => 17,
  'profession' => 'moisture farmer'
  })

customer3.save()

customer4 = Customer.new({
  'name' => 'Han Solo',
  'age' => 32,
  'profession' => 'smuggler'
  })

customer4.save()
