=begin
1. Display 3x3 board
2. Ask the user to mark a square
3. Computer marks a square
4. Display the updated board state
5. If winner, display winner
6. If board is full, display tiwe
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye
=end

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

# GAME SETUP

def prompt(msg)
  puts "=> #{msg}"
end

def display_blank_line
  puts ''
end

# rubocop:disable Metrics/MethodLength, Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "Player is a '#{PLAYER_MARKER}'"
  puts "Computer is an '#{COMPUTER_MARKER}'"
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/MethodLength, Metrics/AbcSize

# TURN FUNCTIONALITY

def initialize_board
  (1..9).each_with_object({}) do |num, new_board|
    new_board[num] = INITIAL_MARKER
  end
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, separator=', ', link='or')
  integer_options = ''
  arr.each_with_index do |integer, index|
    integer = integer.to_s
    return tiny_joinor(arr) if arr.size < 3
    integer_options += if index == arr.size - 1
                         "#{link} #{integer}"
                       else
                         integer + separator
                       end
  end
  integer_options
end

def tiny_joinor(arr)
  arr.size == 2 ? "#{arr[0]} or #{arr[1]}" : arr[0].to_s
end

def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square: #{joinor(empty_squares(brd))}")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid choice.")
  end
  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    if brd.values_at(*line).count('X') == 2 &&
       brd.values_at(*line).count(' ') == 1
      square = line[brd.values_at(*line).index(' ')]
    end
  end

  if square.nil?
    computer_places_randomly!(brd)
  else
    computer_places_defensively!(brd, square)
  end

  brd
end

def computer_places_defensively!(brd, square)
  brd[square] = COMPUTER_MARKER
end

def computer_places_randomly!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

# DETERMINE ROUND OUTCOME

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

# SCORE KEEPING

def update_wins(winner, wins)
  wins[winner] += 1
end

def display_wins(wins)
  prompt("Player score: #{wins['Player']}")
  prompt("Computer score: #{wins['Computer']}")
  puts ''
end

def display_winner(brd)
  prompt("#{detect_winner(brd)} won!")
end

def reset_score!(wins)
  wins['Player'] = 0
  wins['Computer'] = 0
end

# GRAND WINNER

def detect_grand_winner(wins)
  wins.key(5)
end

def display_grand_winner(wins)
  display_blank_line
  prompt("Congrats #{detect_grand_winner(wins)}, you are the grand winner!")
  display_blank_line
end

# PROGRAM

wins = {
  'Player' => 0,
  'Computer' => 0
}

loop do
  board = ''
  loop do
    board = initialize_board
    loop do
      display_board(board)
      display_wins(wins)

      player_places_piece!(board)
      break if someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    display_wins(wins)

    if someone_won?(board)
      update_wins(detect_winner(board), wins)
    else
      prompt("It's a tie!")
    end

    # prompt("Next round in...")
    break if wins.values.any? { |wins_count| wins_count == 5 }
  end

  display_board(board)
  display_wins(wins)
  display_winner(board)
  display_grand_winner(wins)

  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  reset_score!(wins)
end

prompt("Thanks for playing Tic-Tac-Toe! Good Bye!!")
