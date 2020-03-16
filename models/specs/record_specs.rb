require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../record')
require_relative('../../db/seeds')

class RecordTest < MiniTest::Test

  def setup
    options = ('artist_id' => mac_miller.id, 'title' => 'Swimming', 'genre' => 'Hip Hop', 'released' => 2018, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/5/5e/Mac_Miller_-_Swimming.png', 'quantity' => 30, 'buy_price' => 17, 'sell_price' => 24)

    @record1 = Record.new(options)
  end

  def test_sold
    ledzep3.sold(2)
    assert_equal(7,ledzep3.quantity)
  end

end
