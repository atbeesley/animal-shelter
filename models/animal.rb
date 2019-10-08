require_relative('../db/sql_runner')
require_relative('customer')

class Animal

attr_accessor(:name, :type, :admission_date, :adoptable, :id)

def initialize( options )
  @name = options['name']
  @type = options['type']
  @admission_date = options['admission_date']
  @adoptable = options['adoptable']
  @id = options['id'].to_i if options['id']
end

def save()
  sql = "INSERT INTO animals
  (
    name,
    type,
    admission_date,
    adoptable
  )
  VALUES
  (
    $1, $2, $3, $4
  )
  RETURNING *"
  values = [@name, @type, @admission_date, @adoptable]
  result = SqlRunner.run(sql, values)
    id = result.first["id"]
    @id = id.to_i
end

def update()
  sql = "UPDATE animals
  SET (
    name,
    type,
    admission_date,
    adoptable
    ) = (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@name, @type, @admission_date, @adoptable, @id]
SqlRunner.run(sql, values)
end

def delete()
  sql = "DELETE FROM animals
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end

def self.delete_all()
  sql = "DELETE FROM animals"
  SqlRunner.run(sql)
end

def self.all()
  "SELECT * FROM animals"
  animal = SqlRunner.run(sql)
  result = animal.map { |animal| Animal.new(animal)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM animals
  WHERE id = $1"
  values = [id]
  animal = SqlRunner.run(sql, values)
  result = Animal.new
end


end
