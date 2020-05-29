require_relative 'board'
require_relative 'player'

class Game
  def initialize
    player1 = Player.new(:X)
    player2 = Player.new(:O)

    @board = Board.new(player1, player2)

    puts "*** #{player1.name} vs #{player2.name} ***"
    @board.display

    until @board.win? || @board.full? do
      player1.move(@board)
      @board.display
      player2.move(@board)
      @board.display
    end
  end
end