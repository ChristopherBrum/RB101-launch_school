require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

# Board creation & display
def display_board(brd, wins)
  system 'clear'
  puts "You're a '#{PLAYER_MARKER}', Computer is an '#{COMPUTER_MARKER}'"
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
  puts "Player score: #{wins['Player']}"
  puts "Computer score: #{wins['Computer']}"
end

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

# Functionality of each round
def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def joinor(arr, delimiter=', ', joining_word='or')
  case arr.length
  when 1 then "#{arr[0]}"
  when 2 then "#{arr[0]} #{joining_word} #{arr[1]}"
  else 
    last = arr.pop
    "#{arr.join(delimiter)}#{delimiter}#{joining_word} #{last}"
  end
end

# Player & Computer Moves
def player_places_piece!(brd)
  square = ''
  loop do
    prompt("Choose a square (#{joinor(empty_squares(brd))}):")
    square = gets.chomp.to_i
    break if empty_squares(brd).include?(square)
    prompt("Sorry, that's not a valid input.")
  end

  brd[square] = PLAYER_MARKER
end

def computer_places_piece!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

# Determining Winner & Score Keeping
def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd[line[0]] == PLAYER_MARKER &&
       brd[line[1]] == PLAYER_MARKER &&
       brd[line[2]] == PLAYER_MARKER
      return 'Player'
    elsif brd[line[0]] == COMPUTER_MARKER &&
          brd[line[1]] == COMPUTER_MARKER &&
          brd[line[2]] == COMPUTER_MARKER
      return 'Computer'
    end
  end
  nil
end

def update_score(wins, winner, brd)
  wins[winner] += 1
  display_board(brd, wins)
end

def reset_score(wins)
  wins['Player'] = 0
  wins['Computer'] = 0
end

# Grand Winner

def detect_grand_winner(wins)

end

# Game Program

wins = { 'Player' => 0, 'Computer' => 0 }

loop do
  board = initialize_board
  loop do
    loop do
      display_board(board, wins)

      player_places_piece!(board)
      break if  someone_won?(board) || board_full?(board)

      computer_places_piece!(board)
      break if  someone_won?(board) || board_full?(board)
    end

    display_board(board, wins)

    if someone_won?(board)
      prompt("#{detect_winner(board)} won!")
      update_score(wins, detect_winner(board), board)
    else
      prompt("It's a tie!")
    end

    break if wins.values.any? { |win| win >= 5 }
    board = initialize_board
  end

  prompt("Play again? (y or n)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
  reset_score(wins)
end

prompt("Thanks for playing Tic-Tac-Toe! Good bye!")
