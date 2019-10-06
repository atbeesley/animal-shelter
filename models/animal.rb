require_relative('../db/sql_runner')

class Animal

attr_accessor(:name, :type, :admission_date, :adoptable, :id)

def initialize( options )
  @name = options['name']
  @type = options['type']
  @admission_date = options['id']
  @adoptable = options['id']
  @id = options['id'].to_i if options['id']
end

def save()
  sql = "INSERT INTO animals
  (
    name,
    type,
    admission_date,
    adoptable,
  )
  VALUES
  (
    $1, $2, $3, $4
  )
  RETURNING id"
  values = [@name, @type, @admission_date, @adoptable]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
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

def self.all()
  "SELECT * FROM animals"
  individual_animals = SqlRunner.run(sql)
  result = individual_animals.map { |individual_animal| Animal.new(individual_animal)}
  return result
end

def self.find(id)
  sql = "SELECT * FROM animals
  WHERE id = $1"
  values = [id]
  individual_animal = SqlRunner.run(sql, values)
  result = Animal.new
end


end
