require_relative 'Board'
require_relative 'Player'

class Game
  def initialize(player1, player2)
    @board = Board.new
    @current_player = player1
    @other_player = player2
  end

  def play
    loop do
      @board.display

      position = nil

      loop do
        position = @current_player.get_move
        break if @board.valid_move?(position)
        puts "Movimiento invalido. Intenta de nuevo"
      end

      @board.update(position, @current_player.marker)

      if winner?
        @board.display
        puts "#{@current_player.name} ha ganado!"
        break
      elsif @board.full?
        @board.display
        puts "Empate!"
      else
        switch_players
      end

    end
  end

  private

  def winner?
    @board.winning_marker == @current_player.marker
  end

  def switch_players
    @current_player, @other_player = @other_player, @current_player
  end

end
