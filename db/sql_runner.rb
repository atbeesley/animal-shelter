require( 'pg' )

class SqlRunner

  def self.run( sql, values = [] )
    begin
      db = PG.connect({ dbname: 'd3afqbair0jiur', host: 'ec2-23-23-92-204.compute-1.amazonaws.com
', port: 5432, user: 'rptmycrxjmhjcg', password: 'ee490f1ba1a8166d62349cc9fd4018517863b07caf33c038e68939f5454a250f' })
      db.prepare("query", sql)
      result = db.exec_prepared( "query", values )
    ensure
      db.close() if db != nil
    end
    return result
  end

end
