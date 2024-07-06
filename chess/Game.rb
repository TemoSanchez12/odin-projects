require 'yaml'
require_relative 'Board'
require_relative 'Player'

class Game
  attr_reader :board, :players, :current_player

  def initialize
    @board = Board.new
    @players = [Player.new('white'), Player.new('black')]
    @current_player = @players[0]
  end

  def play
    loop do
      @board.display
      puts "#{current_player.color}'s turn"
      start_pos, end_pos = current_player.get_move
      @board.move_piece(start_pos, end_pos)
      swap_turn!
      break if checkmate?
    end
    puts "Checkmate! #{current_player.color} wins!"
  end

  def checkmate?
    king_position = find_king(current_player)
    return false unless in_check?(king_position)

    @board.grid.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        next if piece.nil? || piece.color != current_player

        piece.valid_moves.each do |move|
          dup_board = @board.dup
          dup_board.move_piece([row_index, col_index], move)
          return false unless dup_board.in_check?(king_position)
        end
      end
    end
    true
  end

  def save_game(filename = 'saved_game.yaml')
    data = {
      board: @board,
      current_player: @current_player
    }
    File.open(filename, 'w') { |file| file.write(YAML.dump(data)) }
    puts "Game saved to #{filename}"
  end

  def load_game(filename = 'saved_game.yaml')
    data = YAML.load(File.read(filename))
    @board = data[:board]
    @current_player = data[:current_player]
    puts "Game loaded from #{filename}"
  end

  private

  def find_king(color)
    @board.grid.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        return [row_index, col_index] if piece.is_a?(King) && piece.color == color
      end
    end
  end

  def in_check?(king_position)
    @board.grid.each_with_index do |row, row_index|
      row.each_with_index do |piece, col_index|
        next if piece.nil? || piece.color == current_player

        return true if piece.valid_moves.include?(king_position)
      end
    end
    false
  end
end
