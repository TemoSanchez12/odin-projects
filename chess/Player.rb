class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def get_move
    puts "Enter your move (e.g., 'e2 e4')"
    move = gets.chomp
    start_pos, end_pos = parse_move(move)
    [start_pos, end_pos]
  end

  def parse_move(move)
    puts 'paso una vez'
    # Verifica que la entrada del usuario sea válida
    if move.match?(/^[a-h][1-8]$/)
      col = move[0].ord - 'a'.ord
      row = move[1].to_i
      [row, col]
    else
      raise ArgumentError, "Invalid move format. Please use the format 'a1', 'b2', etc."
    end
  end
end
