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

# GAME MECHANICS

def initialize_deck(values, suits)
  suits.each_with_object([]) do |suit, array|
    values.each { |value| array.push([value, suit]) }
  end
end

def take_card_from_deck!(deck) 
  deck.delete(deck.sample)
end

def initial_deal!(plr, dlr, deck)
  2.times do  
    plr.push(take_card_from_deck!(deck))
    dlr.push(take_card_from_deck!(deck))
  end 
end

def initialize_game(player, dealer, deck)
  system 'clear'
  initial_deal!(player, dealer, deck)
end

def display_hands_and_score(dealer, player)
  display_dealer_hand(dealer)
  display_player_hand(player)
  display_blank_space
  puts "Your current score: #{tally_score(player)}"
  display_blank_space
end

# FORMATTING AND DISPLAYING HANDS

def is_not_face_card?(card)
  card == card.to_i.to_s
end

def format_card_name(card)
  return card[0] if is_not_face_card?(card[0])
  case card[0]
  when 'J' then 'Jack'
  when 'Q' then 'Queen'
  when 'K' then 'King'
  when 'A' then 'Ace'
  end
end

def format_player_hand(hand)
  formatted_hand = []
  hand.each { |card| formatted_hand.push(format_card_name(card)) }
  last_card = formatted_hand.delete(formatted_hand.last)
  formatted_hand.join(', ').concat(" and #{last_card}")
end

def format_dealer_hand(hand)
  formatted_hand = []
  hand.each { |card| formatted_hand.push(format_card_name(card)) }
  formatted_hand.delete(formatted_hand.last)
  formatted_hand.join(', ').concat(" and unkown")
end

def display_dealer_hand(dlr)
  puts "Dealer has: #{format_dealer_hand(dlr)}"
end

def display_player_hand(plr)
  puts "You have: #{format_player_hand(plr)}"
end

# PLAYER TURN

# SCORE KEEPING

def tally_score(hand)
  score = 0
  hand.each { |card| score += get_card_value(card, score) }
  score
end

def get_card_value(card, score)
  return card.first.to_i if is_not_face_card?(card[0])
  if card.first == 'J' || card.first == 'Q' || card.first == 'K'
    10
  elsif card.first == 'A'
    11
  end
end

def is_twenty_one?(score)
  score == 21
end

def has_busted?(score)
  score > 21
end

loop do 
  deck = initialize_deck(VALUES, SUITS)
  player = []
  dealer = []

  initialize_game(player, dealer, deck)

  # player turn loop
  loop do 
    display_hands_and_score(dealer, player)
    puts "Hit or stay?"
    answer = gets.chomp.downcase
    if answer != 'hit' || answeer != 'stay'
      puts "Sorry, please enter 'hit' or 'stay'."
    end
    player.push(deck.sample) if answer == 'hit'
    break if answer == 'stay' || has_busted?(tally_score(player))
  end

  # dealer turn loop

  break
end
