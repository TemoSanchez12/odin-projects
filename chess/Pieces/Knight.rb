require_relative "Piece"

class Knight < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == 'white' ? "\u2658" : "\u265E"
  end

  def valid_moves(board)
    possible_moves = [
      [2, 1], [2, -1], [-2, 1], [-2, -1],
      [1, 2], [1, -2], [-1, 2], [-1, -2]
    ]

    possible_moves.map { |move| add_position(position, move) }
                  .select { |move| move_within_bounds?(move) }
  end
end
