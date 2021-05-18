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

def two_sec_delay
  sleep(2)
end

def clear_screen
  system 'clear'
end

# GAME MECHANICS

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

# FORMATTING AND DISPLAYING HANDS

def display_dealer_turn
  display_blank_space
  prompt("Dealers turn!")
  two_sec_delay
end

def display_hands_and_score(player, dealer)
  clear_screen
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

# PLAYER TURN

def player_turn(player, dealer, deck)
  loop do
    display_hands_and_score(player, dealer)
    prompt("Hit or stay?")
    answer = gets.chomp.downcase

    player.push(deck.sample) if answer == 'hit'
    break if answer == 'stay' || busted?(fetch_current_score(player))
  end
end

# DEALERS TURN

def dealer_turn(dealer, player, deck)
  dealer.push(deck.sample)
  display_hands_and_score(player, dealer)
  loop do
    break if busted?(fetch_current_score(player)) ||
             busted?(fetch_current_score(dealer)) ||
             fetch_current_score(dealer) >= 17
    display_dealer_hits
    dealer.push(deck.sample)
    display_hands_and_score(player, dealer)
  end
end

# SCORE KEEPING

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
  (score + 11) > 21 ? 1 : 11
end

def not_face_card?(card)
  card == card.to_i.to_s
end

def busted?(score)
  score > 21
end

def determine_winner(dealer, player)
  dlr = fetch_current_score(dealer)
  plr = fetch_current_score(player)
  if plr > 21
    prompt("You bust. Dealer Wins!")
  elsif dlr > 21
    prompt("Dealer busts. You win!")
  elsif plr > dlr
    prompt("You win!")
  elsif dlr >= plr
    prompt("Dealer wins!")
  end
end

# PROGRAM

loop do
  deck = initialize_deck(VALUES, SUITS)
  player = []
  dealer = []

  initialize_game(player, dealer, deck)
  player_turn(player, dealer, deck)
  # determine_winner(dealer, player)
  dealer_turn(dealer, player, deck)
  determine_winner(dealer, player)
  break
end
