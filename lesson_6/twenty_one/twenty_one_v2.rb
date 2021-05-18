=begin
High Level Pseudo Code

1. Initialize deck
2. Deal cards to player and dealer
3. Player turn: hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins.
5. Dealer turn: hit or stay
  - repeat until total >= 17
6. If dealer bust, player wins.
7. Compare cards and declare winner.
=end

require 'pry'

VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(C D H S)
FACE_CARDS = { 'J': 'Jack', 'Q': 'Queen', 'K': 'King', 'A': 'Ace' }

def display_blank_space
  puts ''
end

def prompt(msg)
  puts "=> #{msg}"
end

def clear_screen
  system 'clear'
end

def display_players_turn
  prompt("Player, it's your turn.")
  display_blank_space
end

def display_score(player_score, dealer_score)
  prompt("Dealer current score: #{dealer_score}")
  prompt("Your current score: #{player_score}")
  display_blank_space
end

def display_game(player, dealer, score)
  clear_screen
  player_score = fetch_current_score(player, score[:player])
  dealer_score = fetch_current_score(dealer, score[:dealer])
  display_hands(player, dealer)
  display_score(player_score, dealer_score)
end

# GAME INITIALIZATION

def initialize_deck(values, suits)
  suits.each_with_object([]) do |suit, array|
    values.each { |value| array.push([value, suit]) }
  end
end

def initialize_game(player, dealer, deck)
  initial_deal!(player, dealer, deck)
end

def initial_deal!(player, dealer, deck)
  2.times { player.push(take_card_from_deck!(deck)) }
  dealer.push(take_card_from_deck!(deck))
end

def take_card_from_deck!(deck)
  deck.delete(deck.sample)
end

def add_card_to_hand(hand, deck)
  hand.push(take_card_from_deck!(deck))
end

# DISPLAY HANDS & CARD FORMATTING

def display_hands(player, dealer)
  prompt("Dealers hand: #{format_hand(dealer)}")
  prompt("Your hand: #{format_hand(player)}")
  display_blank_space
end

def format_hand(hand)
  formatted_cards = hand.map { |card| format_card(card) }
  formatted_cards.push('unknown') if formatted_cards.size < 2
  last_card = formatted_cards.delete_at(-1)
  formatted_cards.join(', ').concat(" and #{last_card}")
end

def format_card(card)
  return card[0] if number_card?(card[0])
  case card[0]
  when 'J' then 'Jack'
  when 'Q' then 'Queen'
  when 'K' then 'King'
  when 'A' then 'Ace'
  end
end

def number_card?(card)
  card == card.to_i.to_s
end

# SCORE KEEPING & DISPLAY

# def update_score!(dealer, player, score)
#   score[:player] = fetch_current_score(player, score)
# end

def fetch_current_score(hand, score)
  current_score = score
  hand.each { |card| current_score += get_card_value(card[0], current_score) }
  current_score
end

def get_card_value(card, score)
  return card.to_i if not_face_card?(card)
  if card == 'J' || card == 'Q' || card == 'K'
    10
  elsif card == 'A'
    determine_ace_value(score)
  end
end

def determine_ace_value(score)
  (score + 11) > 21 ? 1 : 11
end

def not_face_card?(card)
  card == card.to_i.to_s
end

def busted?(score)
  score > 21
end

# PLAYER TURN MECHANICS

def hit?
  answer = ''
  loop do
    prompt("Hit or stay?")
    answer = gets.chomp.downcase
    break if valid_answer?(answer)
    prompt("Sorry, that's not a valid input")
  end
  %w(h hit).include?(answer)
end

def valid_answer?(answer)
  %w(hit stay h s).include?(answer)
end

# DEALER TURN MECHANICS

def dealer_stays?(score)
  score >= 17
end

# GAME LOOP

loop do
  clear_screen
  deck = initialize_deck(VALUES, SUITS)
  score = { player: 0, dealer: 0 }
  player = []
  dealer = []
  initial_deal!(player, dealer, deck)
  display_game(player, dealer, score)

  # PLAYER TURN LOOP
  loop do
    # BREAK NEXT 2 LINES INTO METHOD
    answer = hit?
    break if !answer
    add_card_to_hand(player, deck)
    display_game(player, dealer, score)
    break if busted?(fetch_current_score(player, score[:player]))
  end

  # DEALER TURN LOOP
  loop do
    add_card_to_hand(dealer, deck)
    display_game(player, dealer, score)
    if busted?(fetch_current_score(player, score[:player])) ||
       busted?(fetch_current_score(dealer, score[:dealer])) ||
       dealer_stays?(score[:dealer])
      break
    end
  end

  # DETERMINE WINNER

  prompt("Play another round? (y or yes)")
  answer = gets.chomp.downcase
  break unless answer == 'y' || answer == 'yes'
end
