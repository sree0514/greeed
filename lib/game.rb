$LOAD_PATH << './lib'
require 'player'

class Game

  NO_OF_PLAYERS = 2
  WIN_SCORE = 3000
  
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end
        
  def winner
    while @player1.points <= WIN_SCORE && @player2.points <= WIN_SCORE do
      @player1.turn
      break if @player1.points >= WIN_SCORE
      @player1.turn if @player1.has_next_chance?
      @player2.turn
      @player2.turn if @player2.has_next_chance? && @player2.points <= WIN_SCORE
    end
    if  @player1.points > @player2.points
       "Winner is player1"
     else
       "Winner is player2"
    end
  end
  
end

g = Game.new(Player.new, Player.new)
puts g.winner
  