# Build a tic-tac-toe game on the command line where two human players can play against each other
# and the board is displayed in between turns.
# main.rb that handles gameplay
# a board class ?what does it hold/do?
# a player class that handles player setup

# gameplay:
# game gets started
# 1 or 2 players get selected (if 1 the other will be computer)
# ?each player gets its own color?
# player 1 gets first turn, chooses their choice
# player 2 gets a turn
# after every turn, check for a win condition.
# if win condition, end game and declare winner.
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
    current = (current + 1) % 2
    count += 1
    board.show
  end

  puts "it's a tie"
  nil
end

play_game
