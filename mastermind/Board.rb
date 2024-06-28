class Board
  attr_writer :code

  def initialize
    @code = Array.new(5, 0)
    @display_code = Array.new(5, 0)
    @board = Array.new(12) { {
      :cells => Array.new(5, 0),
      :feedback => ''
    } }

  end

  def display

    puts 'Codigo'
    print @display_code; puts

    puts 'Tablero'
    @board.reverse_each do |row|
      print row[:cells]; print "  " + row[:feedback]; puts
    end
    puts
  end

  def show_code
    @display_code = @code
    display
  end

  def set_guess_row(row_index, guesses)
    @board[row_index][:cells] = guesses
  end

  def set_guess_feedback(row_index, feedback)
    @board[row_index][:feedback] = feedback
  end
end
