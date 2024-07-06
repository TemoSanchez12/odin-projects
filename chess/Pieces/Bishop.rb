require_relative 'Piece'

class Bishop < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == 'white' ? "\u2657" : "\u265D"
  end

  def valid_moves(board)
    directions = [
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]

    directions.flat_map do |direction|
      moves_in_direction(board, direction)
    end
  end

  private

  def moves_in_direction(board, direction)
    moves = []
    current_pos = add_position(position, direction)

    while move_within_bounds?(current_pos)
      moves << current_pos
      break if board[current_pos] # Stop if there's a piece in the way
      current_pos = add_position(current_pos, direction)
    end

    moves
  end
end
