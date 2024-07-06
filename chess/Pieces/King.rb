require_relative "Piece"

class King < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == 'white' ? "\u2654" : "\u265A"
  end

  def valid_moves(board)
    possible_moves = [
      [1, 0], [0, 1], [-1, 0], [0, -1],
      [1, 1], [1, -1], [-1, 1], [-1, -1]
    ]

    possible_moves.map { |move| add_position(position, move) }
                  .select { |move| move_within_bounds?(move) }
  end
end
