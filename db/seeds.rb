require_relative('models/animal.rb')
require_relative('models/customer.rb')

require('pry-byebug')

Animal.delete_all()
Customer.delete_all()

animal1 = Animal.new({
  'name' => 'Theresa',
  'type' => 'tauntaun'
  'admission_date' => '23/10/2017',
  'adoptable' => true
   })

animal2 = Animal.new({
  'name' => 'Betty',
  'type' => 'bantha',
  'admission_date' => '04/07/2018',
  'adoptable' => true
  })

animal3 = Animal.new({
    'name' => 'Percy',
    'type' => 'porg',
    'admission_date' => '06/06/2019',
    'adoptable' => false
    })

animal4 = Animal.new({
  'name' => 'Ryan',
  'type' => 'Rancor',
  'admission_date' => '10/09/2019',
  'adoptable' => false
  })

animal1.save()
animal2.save()
animal3.save()
animal4.save()

customer1 = Customer.new({
  'name' => 'Obi-Wan Kenobi',
  'age' => 65,
  'profession' => 'Jedi knight',
  })

customer2 = Customer.new({
  'name' => 'Princess Leia',
  'age' => 17,
  'profession' => 'diplomat'
  })

customer3 = Customer.new({
  'name' => 'Luke Skywalker',
  'age' => 17,
  'profession' => 'moisture farmer'
  })

customer4 = Customer.new({
  'name' => 'Han Solo',
  'age' => 32,
  'profession' => 'smuggler and scoundrel'
  })

customer1.save()
customer2.save()
customer3.save()
customer4.save()
