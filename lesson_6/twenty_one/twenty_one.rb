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

VALUES = %w(2 3 4 5 6 7 8 9 10 J Q K A)
SUITS = %w(C D H S)
FACE_CARDS = { 'J': 'Jack', 'Q': 'Queen', 'K': 'King', 'A': 'Ace' }

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

def display_dealer_hand()
  puts "Dealer has: "
end

def display_player_hand()

end

loop do 
  deck = initialize_deck(VALUES, SUITS)
  player = []
  dealer = []

  initial_deal!(player, dealer, deck)

  # player turn loop

  # dealer turn loop
  
  p player, dealer

  break
end
