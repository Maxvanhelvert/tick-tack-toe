# Check for valid choice, if not valid, ask for new choice.

require './board'
require './player'

def play_game
  board = Board.new
  puts 'New 2 player game'
  puts
  board.show

  players = []
  players[0] = Player.new(1, 'X')
  players[1] = Player.new(2, 'O')

  count = 0
  current = 0

  while count < 9
    board.player_turn(players[current].number, players[current].symbol)
    board.show
    break if board.check_win(players[current].number) == true

    current = (current + 1) % 2
    count += 1
  end

  puts "it's a tie" if count >= 9
  nil
end

play_game
