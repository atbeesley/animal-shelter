require_relative('../db/sql_runner')

class Customer

attr_accessor :name, :age, :profession, :id

def initialize(options)
    @id = options['id'].to_i
    @name = options['name']
    @age = options['age']
    @profession = options['profession']
    @owner_id =
end

def save()
  sql = "INSERT INTO customers
  (
    name,
    age,
    profession,
  )
  VALUES
  (
    $1, $2, $3
  )
  RETURNING *"
  values = [@name , @age, @profession]
  result = SqlRunner.run(sql, values)
  id = result.first["id"]
  @id = id.to_i
end

def self.all()
  sql = "SELECT * FROM customers"
  results = SqlRunner.run( sql )
  return results.map { |customer| Customer.new( customer ) }
end

def self.find(id)
  sql = "SELCT FROM customers
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return Customer.new(results.first)
end

def delete_all()
  sql = "DELETE FROM customers"
  SqlRunner.run(sql)
end



end
