VALID_CHOICES = ['rock', 'paper', 'scissors']

def test_method
  prompt("Hello there")
end

def prompt(message)
  puts "=> #{message}"
end

def display_result(player, computer)
  if (player == 'rock' && computer == 'scissors') ||
     (player == 'paper' && computer == 'rock') ||
     (player == 'scissors' && computer == 'paper')
    prompt("You win!")
  elsif (player == 'scissors' && computer == 'rock') ||
        (player == 'rock' && computer == 'paper') ||
        (player == 'paper' && computer == 'scissors')
    prompt("Computer Won!")
  else
    prompt("It's a tie!")
  end
end

loop do
  system('clear')
  choice = ''
  computer_choice = VALID_CHOICES.sample

  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    VALID_CHOICES.include?(choice) ? break : prompt("Not a valid choice.")
  end

  prompt("You chose: #{choice}; Computer chose: #{computer_choice}.")

  display_result(choice, computer_choice)

  prompt("Do you want to play again?")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing. Goodbye!")
