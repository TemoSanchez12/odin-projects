module TicTacToe
  Game.new(ComputerPlayer, ComputerPlayer).play

  players_with_human = [HumanPlayer, ComputerPlayer].shuffle

  Game.new(*players_with_human).play
end
