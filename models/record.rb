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

end
