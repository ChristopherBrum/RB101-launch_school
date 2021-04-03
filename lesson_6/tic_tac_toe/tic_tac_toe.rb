FIRST_MOVE = 'choose'
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
GAMES_TO_WIN = 5
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

def display_countdown
  puts ""
  print 'Next round in '
  [3, 2, 1].each do |num|
    print "#{num} "
    sleep(0.85)
  end
end

def display_welcome
  system 'clear'
  puts "~~~~~~~~~~~~~~~~~~~~> WELCOME TO TIC_TAC_TOE <~~~~~~~~~~~~~~~~~~~~"
  display_blank_line
end

# rubocop:disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  display_game_legend
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
# rubocop:enable Metrics/AbcSize

def display_game_legend
  puts "Player is a '#{PLAYER_MARKER}'"
  puts "Computer is an '#{COMPUTER_MARKER}'"
  puts ''
  puts "Square selection locations:"
  puts "1|2|3"
  puts "4|5|6"
  puts "7|8|9"
end

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

# DETERMINING PLAYER ORDER

def determine_who_goes_first
  return 'player' if FIRST_MOVE == 'player'
  return 'computer' if FIRST_MOVE == 'computer'
  answer = ''
  loop do
    prompt("Choose who goes first: Enter 'c' for computer or 'p' for player")
    answer = gets.chomp.downcase
    break if answer == 'c' || answer == 'p'
    prompt("Sorry, lets try that again.")
  end
  return 'computer' if answer == 'c'
  return 'player' if answer == 'p'
end

def alternate_player(current_player)
  return 'computer' if current_player == 'player'
  return 'player' if current_player == 'computer'
end

def place_piece!(brd, current_player)
  player_places_piece!(brd) if current_player == 'player'
  computer_places_piece!(brd) if current_player == 'computer'
end

# PLAYER PLACES PIECE

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

# COMPUTER PLACES PIECE

def computer_places_piece!(brd)
  square = nil

  WINNING_LINES.each do |line|
    break if square
    square = determine_square_threat(line, brd, COMPUTER_MARKER)
  end

  WINNING_LINES.each do |line|
    break if square
    square = determine_square_threat(line, brd, PLAYER_MARKER)
  end

  if !square
    square = (brd[5] == INITIAL_MARKER ? 5 : empty_squares(brd).sample)
  end

  brd[square] = COMPUTER_MARKER
end

def determine_square_threat(line, brd, marker)
  if brd.values_at(*line).count(marker) == 2
    brd.select { |k, v| line.include?(k) && v == ' ' }.keys.first
  end
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
  display_countdown
end

def reset_score!(wins)
  wins['Player'] = 0
  wins['Computer'] = 0
end

def display_round_end(board, wins)
  if someone_won?(board)
    update_wins(detect_winner(board), wins)
    display_wins(wins)
    display_winner(board)
  else
    prompt("It's a tie!")
    display_countdown
  end
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

wins = { 'Player' => 0, 'Computer' => 0 }

loop do
  board = ''
  display_welcome
  starting_player = determine_who_goes_first

  loop do
    board = initialize_board
    current_player = starting_player

    loop do
      display_board(board)
      display_wins(wins)

      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)
    display_round_end(board, wins)

    break if wins.values.any? { |wins_count| wins_count >= GAMES_TO_WIN }
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
