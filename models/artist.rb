class Artist

attr_reader :id
attr_accessor :name, :activity

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @status = options['status']
  end

  def save()
    sql = "INSERT INTO artists (name, status) VALUES ($1, $2) RETURNING id"
    values = [@name, @status]
    artist = SqlRunner.run(sql, values).first
    @id = artist['id'].to_i
  end

  def delete()
    sql= "DELETE FROM artists WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE artists SET (name, status) = ($1, $2) WHERE id = $3"
    values = [@name, @status, @id]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists = SqlRunner.run(sql)
    result = artists.map {|artist| Artist.new(artist)}
    return result
  end

  def self.delete_all()
    sql= "DELETE FROM artists"
    SqlRunner.run(sql)
  end

  def self.find( id )
  sql = "SELECT * FROM artists WHERE id = $1"
  values = [id]
  artist = SqlRunner.run( sql, values )
  result = Artist.new( artist.first )
  return result
end
end
