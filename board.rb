require 'colorize'

class Board
  EMPTY_BOARD = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

  def initialize
    @game_board = EMPTY_BOARD.map(&:dup)
  end

  def show
    puts
    @game_board.each_with_index do |row, row_index|
      row.each_with_index do |cell, cell_index|
        if cell == 'X'
          print " #{cell} ".colorize(:blue)
        elsif cell == 'O'
          print " #{cell} ".colorize(:red)
        else
          print " #{cell} "
        end
        print '|' unless (cell_index + 1) % 3 == 0
      end
      puts
      puts '-----------' unless (row_index + 1) % 3 == 0
    end
    puts
  end

  def valid(choice)
    current_board = @game_board.flatten
    current_board.include?(choice)
  end

  def check_win(player)
    win_conditions = [
      [@game_board[0][0], @game_board[0][1], @game_board[0][2]],
      [@game_board[1][0], @game_board[1][1], @game_board[1][2]],
      [@game_board[2][0], @game_board[2][1], @game_board[2][2]],

      [@game_board[0][0], @game_board[1][0], @game_board[2][0]],
      [@game_board[0][1], @game_board[1][1], @game_board[2][1]],
      [@game_board[0][2], @game_board[1][2], @game_board[2][2]],

      [@game_board[0][0], @game_board[1][1], @game_board[2][2]],
      [@game_board[0][2], @game_board[1][1], @game_board[2][0]]
    ]

    win_conditions.each do |condition|
      if condition[0] == condition[1] && condition[0] == condition[2] && %w[X O].include?(condition[0])
        if player == 1
          puts "The winner is player #{player}".colorize(:blue)
        else
          puts "The winner is player #{player}".colorize(:red)
        end
        return true
      end

      next
    end
  end

  def player_turn(num, sym)
    if num == 1
      puts "player #{num}'s turn.".colorize(:blue)
    elsif num == 2
      puts "player #{num}'s turn.".colorize(:red)
    else
      puts "player #{num}'s turn."
    end
    puts 'Choose your space:'
    choice = gets.chomp.to_i

    unless valid(choice)
      until valid(choice)
        puts 'Choose a valid space:'
        choice = gets.chomp.to_i
        break if valid(choice)
      end
    end

    @game_board.each_with_index do |row, r_index|
      row.each_with_index do |cell, c_index|
        @game_board[r_index][c_index] = sym if cell == choice
      end
    end
  end
end
