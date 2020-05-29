class Board
  def initialize(player1, player2)
    @squares = Array.new(9, " ")
    @player1 = player1
    @player2 = player2

    @winning_lines = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6]]
  end

  def display
    puts "       |     |     "
    8.downto(0) do |i|
      if i % 3 == 0
        puts "  #{@squares[i+2]}  "
        unless(i == 0)
          print "  _____|_____|_____"
          puts
        end
        puts "       |     |     "
      elsif i % 3 == 1
        print "  #{@squares[i]}  |"
      else
        print "#{(i + 1) / 3}   #{@squares[i-2]}  |"
      end
    end
    puts "    a     b     c  "
  end

  def mark(player, square)
    return false unless @squares[square] == " "
    @squares[square] = player.marker
  end

  def full?
    if @squares.none? { |square| square == " "}
      display
      puts "Stalemate!"
      return true
    end
  end

  def win?
    @winning_lines.each do |line|
      if line.all? { |square| @squares[square] == @player1.marker }
        puts "#{@player1.name} wins!"
        return true
      end
      if line.all? { |square| @squares[square] == @player2.marker }
        puts "#{@player2.name} wins!"
        return true
      end
    end
    false
  end
end