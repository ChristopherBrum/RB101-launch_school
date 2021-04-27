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

card1 = ['J', 'S']
card2 = ['Q', 'S']
card3 = ['K', 'S']
card4 = ['A', 'S']
card5 = ['5', 'S']
card6 = ['10', 'S']

p format_card_name(card1)
p format_card_name(card2)
p format_card_name(card3)
p format_card_name(card4)
p format_card_name(card5)
p format_card_name(card6)