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

# DISPLAY HANDS & CARD FORMATTING

def display_hands(player, dealer)
  prompt("Dealer has: #{format_hand(dealer)}")
  prompt("You have: #{format_hand(player)}")
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

def display_current_score(player, dealer, score)
  score[:player] = player.map { |card| get_card_value(card[0], score[:player]) }.sum
  score[:dealer] = dealer.map { |card| get_card_value(card[0], score[:dealer]) }.sum
  prompt("Dealer has: #{score[:dealer]}")
  prompt("You have: #{score[:player]}")
  display_blank_space
end

def get_card_value(card, score)
  return card.to_i if is_not_face_card?(card)
  if card == 'J' || card == 'Q' || card == 'K'
    10
  elsif card == 'A'
    (score + 11) > 21 ? 1 : 11
  end
end

def is_not_face_card?(card)
  card == card.to_i.to_s
end

# PLAYER TURN MECHANICS

def hit_or_stay
  answer = ''
  loop do
    prompt("Hit or stay?")
    answer = gets.chomp.downcase
    break if valid_answer?(answer)
    prompt("Sorry, that's not a valid input")
  end
  answer
end

def valid_answer?(answer)
  %w(hit stay h s).include?(answer)
end

# GAME LOOP

loop do
  system 'clear'
  deck = initialize_deck(VALUES, SUITS)
  score = { player: 0, dealer: 0 }
  player = []
  dealer = []

  initial_deal!(player, dealer, deck)
  display_hands(player, dealer)

  # PLAYER TURN LOOP
  loop do
    display_current_score(player  , dealer, score)
    hit_or_stay
    break
  end

  break
end
