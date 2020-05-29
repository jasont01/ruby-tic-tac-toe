class Player
  attr_accessor :name, :marker

  def initialize(marker)
    print "Enter Player's name (#{marker}): "
    @name = gets.chomp
    @marker = marker
  end

  def move(board)
    print "Enter coordinates for #{name}'s move: "
    coordinates = gets.chomp
    until(/[abc]/.match(coordinates[0]) &&  /[123]/.match(coordinates[1]))
      print "Enter coordinates for #{name}'s move (e.g., b3): "
      coordinates = gets.chomp
    end
    index = (coordinates[0].ord - 97) + ((coordinates[1].to_i - 1) * 3)
    return if board.mark(self, index)
    puts "That square is already taken. Please enter the coordinates of an empty square."
    move(board)
  end
end