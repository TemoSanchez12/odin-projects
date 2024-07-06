require_relative 'Pieces/Rook'
require_relative 'Pieces/Knight'
require_relative 'Pieces/Queen'
require_relative 'Pieces/King'
require_relative 'Pieces/Pawn'
require_relative 'Pieces/Bishop'
require_relative 'Pieces/Rook'



class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    setup_pieces
  end

  def setup_pieces
    @grid[0] = [
      Rook.new('white', [0, 0]),
      Knight.new('white', [0, 1]),
      Bishop.new('white', [0, 2]),
      Queen.new('white', [0, 3]),
      King.new('white', [0, 4]),
      Bishop.new('white', [0, 5]),
      Knight.new('white', [0, 6]),
      Rook.new('white', [0, 7])
    ]
    @grid[1].each_index { |i| @grid[1][i] = Pawn.new('white', [1, i]) }

    # Setup black pieces
    @grid[7] = [
      Rook.new('black', [7, 0]),
      Knight.new('black', [7, 1]),
      Bishop.new('black', [7, 2]),
      Queen.new('black', [7, 3]),
      King.new('black', [7, 4]),
      Bishop.new('black', [7, 5]),
      Knight.new('black', [7, 6]),
      Rook.new('black', [7, 7])
    ]
    @grid[6].each_index { |i| @grid[6][i] = Pawn.new('black', [6, i]) }
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
    piece.position = end_pos
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, piece)
    row, col = pos
    grid[row][col] = piece
  end

  def display
    puts '  a b c d e f g h'
    @grid.each_with_index do |row, index|
      print "#{8 - index} "
      row.each do |cell|
        if cell.nil?
          print '. '
        else
          print "#{cell.symbol} "
        end
      end
      puts "#{8 - index}"
    end
    puts '  a b c d e f g h'
  end
end
