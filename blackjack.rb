num_players = 0
while true
  print "Please enter the number of players: "
  num_players = gets.chomp.to_i
  if num_players > 0
    break
  end
end

class Player
  attr_accessor :hand, :position, :name
end


class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end
  def print_suit
    p @suit
  end
  def print_value
    p @value
  end
end

def start_game(num_players)
  suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
  value = {
    1 => 'A',
    2 => '2',
    3 => '3',
    4 => '4',
    5 => '5',
    6 => '6',
    7 => '7',
    8 => '8',
    9 => '9',
    10 => '10',
    11 => 'Jack',
    12 => 'Queen',
    13 => 'King'
  }
  deck = []
  players = []
  suits.each do |suit|
    value.each do |k,v|
      deck.push Card.new(suit, [k,v])
    end
  end
  deck.shuffle!
  while num_players > 0
    players.push Player.new
    num_players -= 1
  end
  players.each_with_index do |player,i|
    print 'Enter the player name: '
    player.name = gets.chomp
    player.position = (i + 1)
    player.hand = []
  end
  # dealing to each player naturally
  dealer = Player.new
  dealer.name = "Dealer"
  dealer.hand = []
  players.push(dealer)
  2.times do
    players.each do |player|
      player.hand.push(deck.pop)
    end
  end
  ary = [deck,players]
  ary
end

def hit(player, deck)
  if deck.length > 0
    player.hand.push(deck.pop)
  end
end

test = start_game(num_players)
players = test[1]
deck = test[0]


