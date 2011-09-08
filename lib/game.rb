class Game
  NO_OF_PLAYERS = 2
  WINNER_SCORE = 3000
  
  def start
    @player1 = Player.new
    @player2 = Player.new
    untill @player1.points >= WINNER_SCORE || @player2.points >= WINNER_SCORE do
      5.times{ |i| @player1.calculate_points(Dice.roll, i) } untill @player1.has_next_chance?
      5.times{ |i| @player1.calculate_points(Dice.roll, i) } untill @player1.has_next_chance?
    end
    if 
  end
  
end
  