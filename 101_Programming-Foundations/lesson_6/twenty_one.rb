# DONE 1. Initialize deck
# DONE 2. Deal cards to player and dealer
# DONE 3. Player turn: hit or stay
# DONE   - repeat until bust or "stay"
# DONE 4. If player bust, dealer wins.
# DONE 5. Dealer turn: hit or stay
#   - repeat until total >= 17
# DONE 6. If dealer bust, player wins.
# DONE 7. Compare cards and declare winner.

# Glossed Over
# - Ace values changing
# - unknown card in dealer's hand
# - function to display results
# - more descriptive play by play

require 'pry'

VALUES = %w(2 3 4 5 6 7 8 9 10 Jack Queen King Ace)
SUIT = %w(Hearts Diamonds Clubs Spades)

def prompt(mess)
  puts "=> #{mess}"
end

def initialize_deck
  new_deck = []
  VALUES.map do |value|
    SUIT.map do |suit|
      new_deck << ["#{value} of #{suit}", value]
    end
  end
  new_deck
end

def value(card, hand)
  case card[1]
  when '2' then 2
  when '3' then 3
  when '4' then 4
  when '5' then 5
  when '6' then 6
  when '7' then 7
  when '8' then 8
  when '9' then 9
  when '10' then 10
  when 'Jack' then 10
  when 'Queen' then 10
  when 'King' then 10
  when 'Ace'  then 11
  end
end



def initial_deal(deck, hand)
  2.times do
    hand << deck.pop
  end
end

def display_hand(hand)
  arr = []
  hand.each { |card_arr| arr << card_arr[1] }
  joinor(arr)
end

def joinor(arr, divider=', ', is_dealer=false)
  case arr.length
  when 2
    arr.join(' and ')
  else
    arr[-1] = "and #{arr[-1]}"
    arr.join(divider)
  end
end

def hit(deck, hand)
  hand << deck.pop
end

def total_value(hand)
  sum = 0
  hand.each { |card_arr| sum += value(card_arr, hand) }
  sum
end

def bust?(hand)
  total_value(hand) > 21
end

def determine_winner(player_hand, dealer_hand)
  if bust?(dealer_hand) || total_value(player_hand) > total_value(dealer_hand)
    'player'
  else
    'dealer'
  end
end
# Game loop starts here

prompt "Welcome to 21!"
loop do
  # initializing starting variables
  deck = initialize_deck.shuffle!
  dealer_hand = []
  player_hand = []

  # dealing initial hands
  initial_deal(deck, dealer_hand)
  initial_deal(deck, player_hand)

  # display the starting hands
  prompt "Dealer has: #{dealer_hand[0][1]} and unknown card"
  prompt "You have: #{display_hand(player_hand)}        =>   Total of #{total_value(player_hand)}"

  # player turn
  loop do
    decision = ''
    loop do
      prompt "Would you like to 1) hit or 2) stay? (Choose the appropriate number)"
      decision = gets.chomp
      break if ['1', 'hit', '2', 'stay'].include?(decision)
      prompt "That is not a valid answer"
    end
    break if ['2', 'stay'].include?(decision)
    hit(deck, player_hand)
    prompt "Dealer has: #{dealer_hand[0][1]} and unknown card"
    prompt "You have: #{display_hand(player_hand)}        =>   Total of #{total_value(player_hand)}"
    break if bust?(player_hand)
  end

  if bust?(player_hand)
    prompt "You busted! The dealer wins"
    break
  end

  loop do
    if total_value(dealer_hand) >= 17
      break
    else
      hit(deck, dealer_hand)
    end
  end
  winner = determine_winner(player_hand, dealer_hand)

  if winner == 'player'
    prompt "You won!!!"
    break
  else
    prompt "The dealer won"
    break
  end



end


# my_hand = [["Queen of Diamonds", "Queen"], ["2 of Spades", "2"], ["10 of Diamonds", '10']]
