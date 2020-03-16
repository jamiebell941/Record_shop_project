require('pry')
require_relative('../models/artist')
require_relative('../models/record')

Artist.delete_all
Record.delete_all

mac_miller = Artist.new('name' => 'Mac Miller', 'status' => 'No Longer Recording')
mac_miller.save
the_chats = Artist.new('name' => 'The Chats', 'status' => 'Recording')
the_chats.save
fleetwood_mac = Artist.new('name' => 'Fleetwood Mac', 'status' => 'No Longer Recording')
fleetwood_mac.save
led_zeppelin = Artist.new('name' => 'Led Zeppelin', 'status' => 'No Longer Recording')
led_zeppelin.save


swimming = Record.new('artist_id' => mac_miller.id, 'title' => 'Swimming', 'genre' => 'Hip Hop', 'released' => 2018, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/5/5e/Mac_Miller_-_Swimming.png', 'quantity' => 30, 'buy_price' => 17, 'sell_price' => 24)
swimming.save
circles = Record.new('artist_id' => mac_miller.id, 'title' => 'Circles', 'genre' => 'Hip Hop', 'released' => 2020, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/1/15/Mac_Miller_-_Circles.png', 'quantity' => 36, 'buy_price' => 20, 'sell_price' => 28)
circles.save
the_devine_feminine = Record.new('artist_id' => mac_miller.id, 'title' => 'The Devine Feminine', 'genre' => 'Hip Hop', 'released' => 2016, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/9/93/Mac_Miller_-_The_Divine_Feminine.png', 'quantity' => 32, 'buy_price' => 18, 'sell_price' => 25)
the_devine_feminine.save
get_this_in_ya = Record.new('artist_id' => the_chats.id, 'title' => 'Get This In Ya', 'genre' => 'Punk', 'released' => 2017, 'artwork' => 'https://f4.bcbits.com/img/a1694138595_16.jpg', 'quantity' => 20, 'buy_price' => 14, 'sell_price' => 22)
get_this_in_ya.save
dine_n_dish = Record.new('artist_id' => the_chats.id, 'title' => 'Dine N Dash', 'genre' => 'Punk', 'released' => 2020, 'artwork' => 'https://amnplify.com.au/wp-content/uploads/2020/03/The-Chats.jpg', 'quantity' => 29, 'buy_price' => 16, 'sell_price' => 21)
dine_n_dish.save
rumours = Record.new('artist_id' => fleetwood_mac.id, 'title' => 'Rumours', 'genre' => 'Rock', 'released' => 1977, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/f/fb/FMacRumours.PNG', 'quantity' => 17, 'buy_price' => 16, 'sell_price' => 24)
rumours.save
fwmac= Record.new('artist_id' => fleetwood_mac.id, 'title' => 'Fleetwood Mac(1975)', 'genre' => 'Rock', 'released' => 1975, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/b/b1/Fleetwood_Mac_-_Fleetwood_Mac_%281975%29.png', 'quantity' => 16, 'buy_price' => 16, 'sell_price' => 24)
fwmac.save
ledzep1 = Record.new('artist_id' => led_zeppelin.id, 'title' => 'Led Zeppelin', 'genre' => 'Rock', 'released' => 1969, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/e/ef/Led_Zeppelin_-_Led_Zeppelin_%281969%29_front_cover.png', 'quantity' => 10, 'buy_price' => 18, 'sell_price' => 26)
ledzep1.save
ledzep2 = Record.new('artist_id' => led_zeppelin.id, 'title' => 'Led Zeppelin II', 'genre' => 'Rock', 'released' => 1969, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/2/20/Led_Zeppelin_-_Led_Zeppelin_II.jpg', 'quantity' => 12, 'buy_price' => 14, 'sell_price' => 26)
ledzep2.save
ledzep3 = Record.new('artist_id' => led_zeppelin.id, 'title' => 'Led Zeppelin III', 'genre' => 'Rock', 'released' => 1970, 'artwork' => 'https://upload.wikimedia.org/wikipedia/en/5/5f/Led_Zeppelin_-_Led_Zeppelin_III.png', 'quantity' => 9, 'buy_price' => 16, 'sell_price' => 26)
ledzep3.save





binding.pry
nil
