require_relative( '../db/sql_runner' )

class Animal

attr_reader(:name, :type, :admission_date, :adoptable, :id)

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



end
