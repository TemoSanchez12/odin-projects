require_relative 'Player'
require_relative 'Game'

player1 = Player.new("Jugador 1", "X")
player2 = Player.new("Jugador 2", "O")

game = Game.new(player1, player2)
game.play
