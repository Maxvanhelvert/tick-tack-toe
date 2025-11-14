class Board
  @@empty_board = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ]

  def initialize
    @game_board = @@empty_board
  end

  def show
    @game_board.each_with_index do |row, row_index|
      row.each do |cell|
        print " #{cell} "
        print '|' unless cell % 3 == 0
      end
      puts
      puts '-----------' unless (row_index + 1) % 3 == 0
    end
  end

  def player_turn(num, sym)
    puts "player #{num}'s turn. \nChoose your space:"
    choice = gets.chomp
    return unless valid(choice)

    @game_board.each do |row|
      row.detect do |cell|
        @game_board[row][cell] = sym if cell == choice
      end
    end
  end

  def valid(choice)
    current_board = @game_board.flatten
    current_board.include?(choice)
  end

  def check_win
    win_conditions = [
      [@game_board[0][0], @game_board[0][1], @game_board[0], [2]],
      [@game_board[1][0], @game_board[1][1], @game_board[1], [2]],
      [@game_board[2][0], @game_board[2][1], @game_board[2], [2]],
      [@game_board[0][0], @game_board[1][0], @game_board[2], [0]],
      [@game_board[0][1], @game_board[1][1], @game_board[2], [1]],
      [@game_board[0][2], @game_board[1][2], @game_board[2], [1]],
      [@game_board[0][0], @game_board[1][1], @game_board[2], [2]],
      [@game_board[0][2], @game_board[1][1], @game_board[2], [0]]
    ]

    win_conditions.each do |condition|
      return condition[0] if condition[0] == condition[1] && condition[0] == condition[2] && !condition[0].is_number?

      next
    end
  end
end
