VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(C D H S)
FACE_CARDS = { 'J': 'Jack', 'Q': 'Queen', 'K': 'King', 'A': 'Ace' }
VALID_ANSWER = %w(h hit s stay)
VALID_HIT = %w(h hit)
HANDS_TO_WIN = 5
MAX_SCORE = 21
GAME_VERSION = {
  21 => [17, 'Twenty-One'],
  31 => [27, 'Thirty-One'],
  41 => [37, 'Fourty-One'],
  51 => [47, 'Fifty-One'],
  61 => [57, 'Sixty-One'],
  71 => [67, 'Seventy-One'],
  81 => [77, 'Eighty-One'],
  91 => [87, 'Ninety-One'],
  101 => [97, 'One-Hundred-One']
}

def display_blank_space
  puts ''
end

def prompt(msg)
  puts "=> #{msg}"
end

def display_streamer
  puts "~~~~~~~~~~~~~~~~~~~~~~~~"
end

def two_sec_delay
  sleep(2)
end

def clear_screen
  system 'clear'
end

def welcome
  loop do
    clear_screen
    display_game_title
    display_rules
    break start?
  end
  clear_screen
  display_dealing_animation
end

def display_game_title
  puts "~~~~~~~~>   Welcome to #{GAME_VERSION[MAX_SCORE][1]}  <~~~~~~~~"
  display_blank_space
end

def display_rules
  prompt("Rules:")
  display_blank_space
  prompt("Closest to #{MAX_SCORE} without going over wins the hand.")
  prompt("In the case of a tie the Dealer wins the hand.")
  prompt("First person to win #{HANDS_TO_WIN} hands is the winner.")
  prompt("Press 'ctrl' + 'c' at any time to exit the game")
  display_blank_space
end

def start?
  loop do
    prompt("Press any key to start the game.")
    answer = gets.chomp
    break if !answer.nil?
  end
  true
end

def display_dealing_animation
  print "=> Dealing Cards"
  4.times do
    sleep(0.8)
    print " ."
  end
end

def goodbye
  display_blank_space
  prompt("Thanks for playing #{GAME_VERSION[MAX_SCORE][1]}!! Goodbye!")
  display_blank_space
end

def initialize_deck(values, suits)
  clear_screen
  suits.each_with_object([]) do |suit, array|
    values.each { |value| array.push([value, suit]) }
  end
end

def initialize_game(player, dealer, deck)
  initial_deal!(player, dealer, deck)
end

def initial_deal!(plr, dlr, deck)
  2.times do
    plr.push(take_card_from_deck!(deck))
  end
  dlr.push(take_card_from_deck!(deck))
end

def take_card_from_deck!(deck)
  deck.delete(deck.sample)
end

def display_dealer_turn
  display_blank_space
  prompt("Dealers turn!")
  two_sec_delay
end

def display_hands_and_score(player, dealer, wins)
  clear_screen
  display_hands_won(wins)
  display_hands(player, dealer)
  display_dealer_score(dealer)
  display_player_score(player)
end

def display_hands(player, dealer)
  prompt("Dealers hand: #{format_hand(dealer)}")
  prompt("Your hand: #{format_hand(player)}")
  display_blank_space
end

def display_player_score(plr)
  prompt("Your current total: #{fetch_current_score(plr)}")
  display_blank_space
end

def display_dealer_score(dlr)
  prompt("Dealer's current total: #{fetch_current_score(dlr)}")
end

def display_dealer_hits
  print "=> Dealer hits"
  3.times do
    print ' .'
    sleep(0.8)
  end
end

def format_hand(hand)
  formatted_cards = hand.map { |card| format_card(card) }
  formatted_cards.push('unknown') if formatted_cards.size < 2
  last_card = formatted_cards.delete_at(-1)
  formatted_cards.join(', ').concat(" and #{last_card}")
end

def format_card(card)
  return card[0] if not_face_card?(card[0])
  case card[0]
  when 'J' then 'Jack'
  when 'Q' then 'Queen'
  when 'K' then 'King'
  when 'A' then 'Ace'
  end
end

def display_hands_won(wins)
  prompt("Hands won by Dealer: #{wins[:dealer]}, \
Hands won by Player: #{wins[:player]}")
  display_blank_space
end

def player_turn(player, dealer, deck, wins)
  loop do
    display_hands_and_score(player, dealer, wins)
    player_hits = hit?
    player.push(deck.sample) if player_hits
    break if busted?(fetch_current_score(player)) || !player_hits
  end
end

def hit?
  answer = ''
  loop do
    prompt("Hit or stay?")
    answer = gets.chomp.downcase.strip
    break if VALID_ANSWER.include?(answer)
    prompt("Invaid inout. Please try again")
    two_sec_delay
  end
  VALID_HIT.include?(answer) ? true : false
end

def dealer_turn(dealer, player, deck, wins)
  dealer.push(deck.sample)
  display_hands_and_score(player, dealer, wins)
  loop do
    break if busted?(fetch_current_score(player)) ||
             busted?(fetch_current_score(dealer)) ||
             fetch_current_score(dealer) >= GAME_VERSION[MAX_SCORE][0]
    display_dealer_hits
    dealer.push(deck.sample)
    display_hands_and_score(player, dealer, wins)
  end
end

def fetch_current_score(hand)
  score = 0
  hand.each { |card| score += get_card_value(card, score) }
  score
end

def get_card_value(card, score)
  return card.first.to_i if not_face_card?(card[0])
  if card.first == 'J' || card.first == 'Q' || card.first == 'K'
    10
  elsif card.first == 'A'
    determine_ace_value(score)
  end
end

def determine_ace_value(score)
  (score + 11) > MAX_SCORE ? 1 : 11
end

def not_face_card?(card)
  card == card.to_i.to_s
end

def busted?(score)
  score > MAX_SCORE
end

def declare_winner(dealer, player, wins)
  dlr = fetch_current_score(dealer)
  plr = fetch_current_score(player)
  if plr > MAX_SCORE
    prompt("You busted. Dealer Wins this hand!")
  elsif dlr > MAX_SCORE
    prompt("Dealer busts. You win this hand!")
  elsif plr > dlr
    prompt("You win this hand!")
  elsif dlr >= plr
    prompt("Dealer wins this hand!")
  end
  display_blank_space
  next_round? unless winner?(wins)
end

def next_round?
  loop do
    prompt("Ready for the next round? Press any key to continue.")
    answer = gets.chomp
    break if !answer.nil?
  end
  true
end

def display_final_scores(player, dealer, wins)
  display_hands_and_score(player, dealer, wins)
  display_streamer
  prompt("Dealer has a #{format_hand(dealer)}, \
for a total of: #{fetch_current_score(dealer)}")
  prompt("You have a #{format_hand(player)}, \
for a total of: #{fetch_current_score(player)}")
  display_streamer
  display_blank_space
end

def update_winner!(player, dealer, wins)
  dlr = fetch_current_score(dealer)
  plr = fetch_current_score(player)
  if plr > MAX_SCORE
    wins[:dealer] += 1
  elsif dlr > MAX_SCORE
    wins[:player] += 1
  elsif plr > dlr
    wins[:player] += 1
  elsif dlr >= plr
    wins[:dealer] += 1
  end
end

def display_game_winner(wins)
  winner = ''
  if wins.key(HANDS_TO_WIN) == :player
    winner = 'Player'
  elsif wins.key(HANDS_TO_WIN) == :dealer
    winner = 'Dealer'
  end
  prompt("")
  puts "==>"
  puts("===>!!! Congratulations #{winner}, you are the grand winner !!!")
  puts "==>"
  prompt("")
  display_blank_space
end

def winner?(wins)
  wins[:dealer] >= HANDS_TO_WIN || wins[:player] >= HANDS_TO_WIN
end

def play_again?
  prompt("Play again? y or yes")
  answer = gets.chomp.downcase
  return true if %w(y yes).include?(answer)
end

welcome
loop do
  wins = { player: 0, dealer: 0 }
  loop do
    deck = initialize_deck(VALUES, SUITS)
    player = []
    dealer = []

    initialize_game(player, dealer, deck)
    player_turn(player, dealer, deck, wins)
    dealer_turn(dealer, player, deck, wins)
    update_winner!(player, dealer, wins)
    display_final_scores(player, dealer, wins)
    declare_winner(dealer, player, wins)
    break if winner?(wins)
  end
  display_game_winner(wins)
  break unless play_again?
end
goodbye
