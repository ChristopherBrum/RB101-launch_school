=begin
The computer currently picks a square at random. That's not very interesting.
Let's make the computer defensive minded, so that if there's an immediate threat,
then it will defend the 3rd square. We'll consider an "immediate threat" to be 2
squares marked by the opponent in a row. If there's no immediate threat, then it
will just pick a random square.

Input: Hash(current board status)
Output: Integer(prevntative game move to avoid defeat)

Rules:
  -If the Player has 2 squares in a row marked Computer will mark the 3rd  square
  -Otherwise it will pick normally

Test Cases:
  computer_defensive_choice({1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>"O", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) == 

Data Structures:
  -Array, Hash, Strings, Integers
  
Algorithm:
  immediate_threat?(board)
    -Iterate through the values of WINNING_LINES
      -If any of winning sub-arrays contain 2 squares occupied by player
      -And
      -The third square is ' '
        -Call the computer_places_defensively method and pass in the square containing with board the square that was ' ' as an argument
      -Otherwise
        -Call the computer_places_piece method normally

  computer_places_defensively!(board, square_to_select)
    -Set the board hash at square_to_select to COMPUTER_MARKER

=end

# WINNING_LINES.each do |line|
#   if brd.values_at(*line).count(PLAYER_MARKER) == 3
#     return 'Player'
#   elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
#     return 'Computer'
#   end
# end

require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +
                [[1, 5, 9], [3, 5, 7]]

board = {1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}

def computer_places_piece!(brd)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count('X') == 2 &&
       brd.values_at(*line).count(' ') == 1
      square = find_immediate_threat(brd, line)
    end
  end
  square == nil ? computer_places_randomly!(brd) : computer_places_defensively!(brd, square)
  brd
end

def find_immediate_threat(brd, line)
  line[brd.values_at(*line).index(' ')]
end

def computer_places_defensively!(brd, square)
  brd[square] = COMPUTER_MARKER
end

def computer_places_randomly!(brd)
  square = empty_squares(brd).sample
  brd[square] = COMPUTER_MARKER
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

p computer_places_piece!({1=>"X", 2=>"X", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) == {1=>"X", 2=>"X", 3=>"O", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>" ", 9=>" "}
p computer_places_piece!({1=>" ", 2=>"X", 3=>" ", 4=>" ", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) == {1=>" ", 2=>"X", 3=>" ", 4=>" ", 5=>"X", 6=>" ", 7=>" ", 8=>"O", 9=>" "}
p computer_places_piece!({1=>"X", 2=>" ", 3=>" ", 4=>" ", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>" "}) == {1=>"X", 2=>" ", 3=>" ", 4=>" ", 5=>"X", 6=>" ", 7=>" ", 8=>" ", 9=>"O"}
p computer_places_piece!({1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>" ", 6=>" ", 7=>"X", 8=>" ", 9=>" "}) == {1=>" ", 2=>" ", 3=>"X", 4=>" ", 5=>"O", 6=>" ", 7=>"X", 8=>" ", 9=>" "}
p computer_places_piece!({1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>" ", 8=>"X", 9=>"X"}) == {1=>" ", 2=>" ", 3=>" ", 4=>" ", 5=>" ", 6=>" ", 7=>"O", 8=>"X", 9=>"X"}
