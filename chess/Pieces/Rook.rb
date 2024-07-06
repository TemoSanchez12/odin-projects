require_relative 'Piece'

class Rook < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == 'white' ? "\u2656" : "\u265C"
  end

  def valid_moves(board)
    directions = [
      [1, 0], [0, 1], [-1, 0], [0, -1]
    ]

    directions.flat_map do |direction|
      moves_in_direction(board, direction)
    end
  end

  private

  def moves_in_direction(board, direction)
    moves = []
    current_pos = add_position(position, direction)

    while move_within_bounds?(position, direction)
      mvoes << current_pos
      break if board[current_pos]
      current_pos = add_position[current_pos, direction]
    end
    return moves
  end
end
