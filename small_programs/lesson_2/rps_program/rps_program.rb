VALID_CHOICES = %w(rock paper scissors)

def test_method
  prompt("Hello there")
end

# test_method

def prompt(message)
  puts "=> #{message}"
end

def win?(first, second)
  (first == 'rock' && second == 'scissors') ||
    (first == 'paper' && second == 'rock') ||
    (first == 'scissors' && second == 'paper')
end

def display_result(player, computer)
  if win?(player, computer)
    prompt("You win!")
  elsif win?(computer, player)
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
