# rubocop:disable Metrics/MethodLength, Metrics/LineLength

VALUES = %w[2 3 4 5 6 7 8 9 10 Jack Queen King Ace]
SUIT = %w[Hearts Diamonds Clubs Spades]
MAX_POINT = 21
MIN_DEALER_POINT = 17

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

def initial_deal(deck, player_hand, dealer_hand)
  2.times do
    player_hand << deck.pop
    dealer_hand << deck.pop
  end
end

def total_value(hand)
  dealer_hand = []
  value_arr = hand.map { |card| card[1] }

  sum = 0
  value_arr.each do |value|
    if value == "Ace"
      sum += 11
    elsif value.to_i == 0
      sum += 10
    else
      dealer_hand = []
      sum += value.to_i
    end
  end

  value_arr.select { |value| value == "Ace" }.count.times do
    sum -= 10 if sum > MAX_POINT
  end
  sum
end

def display_both_hands(dealer_hand, player_hand, hide_dealer=false)
  prompt "Dealer has: #{display_hand(dealer_hand, hide_dealer)}"
  prompt "You have: #{display_hand(player_hand)}, for a total of #{total_value(player_hand)}"
end

def display_hand(hand, hide_dealer='false')
  if hide_dealer == true
    "#{hand[0][1]} and unknown card."
  else
    arr = []
    hand.each { |card_arr| arr << card_arr[1] }
    joinor(arr)
  end
end

def joinor(arr, divider=', ')
  if arr.length == 2
    arr.join(' and ')
  else
    arr[-1] = "and #{arr[-1]}"
    arr.join(divider)
  end
end

def hit(deck, hand)
  hand << deck.pop
end

def bust?(hand)
  total_value(hand) > MAX_POINT
end

def dealer_done?(dealer_hand)
  total_value(dealer_hand) >= MIN_DEALER_POINT
end

def detect_result(dealer_hand, player_hand)
  player_total = total_value(player_hand)
  dealer_total = total_value(dealer_hand)

  if player_total > MAX_POINT
    :player_busted
  elsif dealer_total > MAX_POINT
    :dealer_busted
  elsif dealer_total < player_total
    :player
  elsif dealer_total > player_total
    :dealer
  else
    :tie
  end
end

def display_result(dealer_hand, player_hand)
  result = detect_result(dealer_hand, player_hand)

  case result
  when :player_busted
    prompt "You busted! Dealer wins!"
  when :dealer_busted
    prompt "Dealer busted! You win!"
  when :player
    prompt "You win!"
  when :dealer
    prompt "Dealer wins!"
  when :tie
    prompt "It's a tie!"
  end
end

player_wins = 0
dealer_wins = 0
loop do
  prompt "Welcome to #{MAX_POINT}!"

  loop do
    prompt "Please wait while we deal the hand..."
    sleep 1
    # initializing starting variables
    deck = initialize_deck.shuffle!
    dealer_hand = []
    player_hand = []

    # dealing initial hands
    initial_deal(deck, player_hand, dealer_hand)

    display_both_hands(dealer_hand, player_hand, true)

    # player turn
    loop do
      decision = ''
      loop do
        prompt "Would you like to 1) hit or 2) stay? (Choose the appropriate number)"
        decision = gets.chomp
        break if ['1', '2'].include?(decision)
        prompt "That is not a valid choice"
      end

      if ['2', 'stay'].include?(decision)
        prompt "You stayed at #{total_value(player_hand)}"
        break
      end

      prompt "You decided to hit!"
      hit(deck, player_hand)

      if bust?(player_hand)
        display_both_hands(dealer_hand, player_hand)
        break
      else
        display_both_hands(dealer_hand, player_hand, true)
      end
    end

    if bust?(player_hand)
      display_result(dealer_hand, player_hand)
      break
    end

    # dealer turn
    prompt "Now it is the dealer's turn."
    sleep 1

    loop do
      break if dealer_done?(dealer_hand)
      prompt "Dealer hits..."
      sleep 1
      hit(deck, dealer_hand)
      prompt "Dealer has: #{display_hand(dealer_hand)}"
    end

    display_result(dealer_hand, player_hand)
    sleep 1
    puts "==============================="
    prompt "Final Results:"
    prompt "Dealer has #{display_hand(dealer_hand)}, for a total of: #{total_value(dealer_hand)}"
    prompt "Player has #{display_hand(player_hand)}, for a total of: #{total_value(player_hand)}"
    puts "==============================="

    break
  end

  prompt "Would you like to play again? (Y/n)"
  ans = gets.chomp
  break unless ans.downcase.start_with?('y')
end

prompt "Thank you for playing!"
