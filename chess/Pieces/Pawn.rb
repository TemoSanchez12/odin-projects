require_relative "Piece"

class Pawn < Piece
  def initialize(color, position)
    super(color, position)
    @symbol = color == 'white' ? "\u2659" : "\u265F"
  end

  def valid_moves(board)
    forward_direction = color == 'white' ? -1 : 1
    possible_moves = [[forward_direction, 0]]
    possible_moves << [forward_direction * 2, 0] if starting_position?
    possible_moves << [forward_direction, 1] if capture_move?([forward_direction, 1], board)
    possible_moves << [forward_direction, -1] if capture_move?([forward_direction, -1], board)

    possible_moves.map { |move| add_position(position, move) }
                  .select { |move| move_within_bounds?(move) }
  end

  private

  def starting_position?
    (color == 'white' && position[0] == 6) || (color == 'black' && position[0] == 1)
  end

  def capture_move?(move, board)
    target_pos = add_position(position, move)
    move_within_bounds?(target_pos) && board[target_pos] && board[target_pos].color != color
  end
end
