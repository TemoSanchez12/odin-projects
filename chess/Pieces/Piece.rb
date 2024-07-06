class Piece
  attr_accessor :position
  attr_reader :color, :symbol

  def initialize(color, position)
    @color = color
    @position = position
  end

  def valid_moves
    raise NotImplementedError, 'This method should be implemented in the subclass'
  end

  protected

  def move_within_bounds?(pos)
    pos.all? { |coord| coord.between?(0, 7) }
  end

  def add_position(pos1, pos2)
    [pos1[0] + pos2[0], pos1[1] + pos2[1]]
  end

end
