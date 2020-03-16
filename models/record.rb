require_relative('../db/sql_runner')

class Record

attr_reader :id, :artist_id, :released, :artwork, :buy_price
attr_accessor :title, :genre, :quantity, :sell_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @artist_id = options['artist_id'].to_i
    @title = options['title']
    @genre = options['genre']
    @released = options['released']
    @artwork = options['artwork']
    @quantity = options['quantity']
    @buy_price = options['buy_price']
    @sell_price = options['sell_price']
  end

  def save()
    sql = "INSERT INTO records (artist_id, title, genre, released, artwork, quantity, buy_price, sell_price) VALUES ($1, $2, $3, $4, $5, $6, $7, $8) RETURNING *"
    values =[@artist_id, @title, @genre, @released, @artwork, @quantity, @buy_price, @sell_price]
    record = SqlRunner.run(sql, values)
    @id = record.first['id'].to_i
  end

  def delete()
    sql= "DELETE FROM records WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE records SET (title, genre, released, artwork, quantity, buy_price, sell_price) = ($1, $2, $3, $4, $5, $6, $7) WHERE id = $8"
    values = [@title, @genre, @released, @artwork, @quantity, @buy_price, @sell_price, @id]
    SqlRunner.run(sql, values)
  end

  def update_qty()
    sql = "UPDATE records SET quantity = $1 WHERE id = $2"
    values = [@quantity, @id]
    SqlRunner.run(sql, values)
  end

  def artist_name
    sql ="SELECT name FROM artists INNER JOIN records ON artist_id = artists.id where records.id = $1"
    values =[@id]
    artist_name = SqlRunner.run(sql, values)
    result = artist_name.map {|name| name['name']}.first
    return result
  end

  def self.all()
    sql = "SELECT * FROM records"
    records = SqlRunner.run(sql)
    result = records.map {|record| Record.new(record)}
    return result
  end

  def self.delete_all()
    sql = "DELETE FROM records"
    SqlRunner.run(sql)
  end

  def self.find_id( id )
    sql = "SELECT * FROM records WHERE id = $1"
    values = [id]
    record = SqlRunner.run( sql, values )
    result = Record.new( record.first )
    return result
  end

  def self.find_genre( genre )
    sql = "SELECT * FROM records WHERE genre = $1"
    values = [genre]
    records = SqlRunner.run( sql, values )
    result = records.map {|record| Record.new(record)}
    return result
  end

  def self.find_artist(artist_id)
    sql = "SELECT * FROM records WHERE artist_id = $1"
    values = [artist_id]
    records = SqlRunner.run( sql, values )
    result = records.map {|record| Record.new(record)}
    return result
  end

end
