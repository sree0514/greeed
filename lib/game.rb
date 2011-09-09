$LOAD_PATH << './lib'
require 'player'

class Game

  NO_OF_PLAYERS = 2
  WIN_SCORE = 3000
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
        
  def start
    while @player1.points <= WIN_SCORE || @player2.points <= WIN_SCORE do
      5.times{ |i| @player1.calculate_points(Dice.roll, i) }
      @player1.points = 0 unless @player1.got_eligible_score?
      puts "first #{@player1.points}"
      break if @player1.points >= WIN_SCORE
      5.times{ |i| @player1.calculate_points(Dice.roll, i) } if @player1.has_next_chance?
      5.times{ |i| @player2.calculate_points(Dice.roll, i) }
      @player1.points = 0 unless @player2.got_eligible_score?
      puts "Second #{@player2.points}"
      5.times{ |i| @player2.calculate_points(Dice.roll, i) } if @player2.has_next_chance? && @player2.points <= WIN_SCORE
    end
  end
  
  def winner
    if  @player1.points > @player2.points
       "Winner is player1"
     else
       "Winner is player2"
    end
  end
  
end
g = Game.new(Player.new, Player.new)
g.start
puts g.winner  