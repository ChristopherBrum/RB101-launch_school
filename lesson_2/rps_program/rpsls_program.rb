require 'pry'

VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_INPUTS = %w(r p sc l sp)
WINNERS_HASH = {
  'rock' => ['scissors', 'lizard'],
  'paper' => ['rock', 'spock'],
  'scissors' => ['paper', 'lizard'],
  'lizard' => ['spock', 'paper'],
  'spock' => ['scissors', 'rock']
}
GOAL_WINS = 5

##### Meassagiong & Layout #####

def clear_screen
  system('clear')
end

def clear_screen_after_first(wins)
  clear_screen if wins.any? { |key, value| value > 0 }
end

def display_blank_space
  puts
end

def prompt(message)
  puts "=> #{message}"
end

def welcome
  puts "====>  Welcome to Rock-Paper-Scissors-Lizard-Spock  <===="
end

def display_score(wins)
  prompt("First person to 5 wins is the GRAND WINNER")
  prompt("Your wins: #{wins[:user]}, Computer wins: #{wins[:computer]}, Ties: #{wins[:tie]}")
  display_blank_space
end

def display_choices
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("Enter 'r' for rock, 'p' for paper, 'sc' for scissors,"\
        " 'l' for lizard', 'sp' for spock")
  display_blank_space
end

def display_input_error
  prompt("Not a valid choice. Try again.")
  sleep 2.0
end

def display_winner(player, computer)
  display_blank_space
  display_result(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
  display_blank_space
end

def display_result(player, computer)
  prompt("You chose: #{player}, Computer chose: #{computer}.")
end

def display_finale(wins_tally)
  display_blank_space
  prompt("#{return_grand_winner(wins_tally)} the GRAND WINNER!!")
  display_blank_space
  prompt("Your wins: #{wins_tally[:user]}")
  prompt("The computers wins: #{wins_tally[:computer]}")
  prompt("Ties: #{wins_tally[:tie]}")
  display_blank_space
end

def display_farewell
  display_blank_space
  prompt("Thanks for playing! Goodbye!!")
end
##### Animations #####

def determine_animation(wins)
  if wins[:user] == GOAL_WINS || wins[:computer] == GOAL_WINS
    winners_animation
  else
    new_round_animation
  end 
end

def new_round_animation
  count = 1

  print "=> Next round in..."
  while count > 0 
    print " #{count}"
    count -= 1
    sleep 1.0
  end
end

def winners_animation
  25.times do
    print '!'
    sleep 0.05
    print '~'
    sleep 0.05
  end
  display_blank_space
end

##### Validation #####

def valid_choice?(choice)
  VALID_INPUTS.include?(choice)
end

def valid_yes?(answer)
  %w(y Y).include?(answer)
end

##### Determine One Time Winner #####

def retrieve_player_choice(wins)
  choice = ''
  loop do
    clear_screen_after_first(wins)
    display_score(wins)
    display_choices
    choice = gets.chomp.downcase
    valid_choice?(choice) ? break : display_input_error
  end
  convert_choice_input(choice)
end

def convert_choice_input(choice)
  VALID_CHOICES[VALID_INPUTS.index(choice)]
end

def win?(first, second)
  WINNERS_HASH[first].include?(second)
end

##### Determine Grand Winner #####

def determine_winner(player, computer)
  if win?(player, computer)
    :user
  elsif win?(computer, player)
    :computer
  else
    :tie
  end
end

def update_wins(winner, scoreboard)
  scoreboard[winner] += 1
end

def grand_winner?(wins)
  wins[:user] == GOAL_WINS || wins[:computer] == GOAL_WINS
end

def return_grand_winner(wins)
  if wins[:user] == GOAL_WINS
    "You are"
  elsif wins[:computer] == GOAL_WINS
    "The computer is"
  end
end

##### Ending #####

def play_again?()
  prompt("Would you like to play again? (y/Y to play)")
  answer = gets.chomp.downcase
  valid_yes?(answer)
end

##### Program #####

clear_screen
welcome
display_blank_space
wins = { user: 0, computer: 0, tie: 0 }

loop do
  choice = retrieve_player_choice(wins)
  computer_choice = VALID_CHOICES.sample
  display_winner(choice, computer_choice)
  update_wins(determine_winner(choice, computer_choice), wins)
  determine_animation(wins)
  display_finale(wins)
  if grand_winner?(wins)
    play_again? ? wins = { user: 0, computer: 0, tie: 0 } : break
  end
  clear_screen
end

display_farewell
