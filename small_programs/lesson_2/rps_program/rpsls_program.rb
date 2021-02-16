VALID_CHOICES = %w(rock paper scissors lizard spock)
VALID_INPUTS = %w(r p sc l sp)

##### Meassagiong & Layout #####

def clear_screen
  system('clear')
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

def display_choices
  prompt("Choose one: #{VALID_CHOICES.join(', ')}")
  prompt("Enter 'r' for rock, 'p' for paper, 'sc' for scissors, 'l' for lizard', 'sp' for spock")
end

def display_winner(player, computer)
  if win?(player, computer)
    prompt("You chose: #{player}; Computer chose: #{computer}.")
    prompt("You win!")
  elsif win?(computer, player)
    prompt("You chose: #{player}; Computer chose: #{computer}.")
    prompt("Computer Won!")
  else
    prompt("You chose: #{player}; Computer chose: #{computer}.")
    prompt("It's a tie!")
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

##### Determine One Time Winner #####

def convert_choice_input(choice)
  VALID_CHOICES[VALID_INPUTS.index(choice)]
end

def win?(first, second)
  (first == 'rock' && (second == 'scissors' || second == 'lizard')) ||
    (first == 'paper' && (second == 'rock' || second == 'spock')) ||
    (first == 'scissors' && (second == 'paper' || second == 'lizard')) ||
    (first == 'lizard' && (second == 'spock' || second == 'paper')) ||
    (first == 'spock' && (second == 'scissors' || second == 'rock'))
end

##### Determine Grand Winner #####

def determine_wins(player, computer)
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
  wins[:user] == 5 || wins[:computer] == 5
end

def return_grand_winner(wins)
  if wins[:user] == 5
    "You are"
  elsif wins[:computer] == 5
    "The computer is"
  end
end

def finale(wins_tally)
  display_blank_space
  winners_animation
  display_blank_space
  prompt("#{return_grand_winner(wins_tally)} the GRAND WINNER!!")
  display_blank_space
  prompt("Your wins: #{wins_tally[:user]}")
  prompt("The computers wins: #{wins_tally[:computer]}")
  prompt("Ties: #{wins_tally[:tie]}")
  display_blank_space
  prompt("Congratulations and thanks for playing. Goodbye!")
end

##### Program #####

clear_screen
welcome
display_blank_space
wins = {user: 0, computer: 0, tie: 0}

loop do
  choice = ''
  computer_choice = VALID_CHOICES.sample

  loop do
    display_choices
    choice = gets.chomp
    valid_choice?(choice) ? break : prompt("Not a valid choice.")
  end

  choice = convert_choice_input(choice)
  display_winner(choice, computer_choice)
  update_wins(determine_wins(choice, computer_choice), wins)
  break if grand_winner?(wins)
end

finale(wins)
