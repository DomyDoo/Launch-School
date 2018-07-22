
VALID_CHOICES = %w(rock paper scissors lizard spock)

INPUT_CHOICES = { 'rock' => ['rock', 'r'],
                  'paper' => ['paper', 'p'],
                  'scissors' => ['scissors', 'sc', 's'],
                  'lizard' => ['lizard', 'l'],
                  'spock' => ['spock', 'sp', 's'] }

WINNING_LOGIC = { 'rock' => ['scissors', 'lizard'],
                  'paper' => ['rock', 'spock'],
                  'scissors' => ['paper', 'lizard'],
                  'lizard' => ['paper', 'spock'],
                  'spock' => ['scissors', 'rock'] }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def return_correct_s
  loop do
    prompt('You entered "s". Choose between 1) scissors or 2) spock. Enter the correct number.')
    s_selection = Kernel.gets().chomp()
    if s_selection == '1'
      return 'scissors'
    elsif s_selection == '2'
      return 'spock'
    else
      prompt("That's not a valid choice.")
    end
  end
end

def win?(first, second)
  WINNING_LOGIC[first].include?(second)
end

def return_winner(player, computer)
  if win?(player, computer)
    "player"
  elsif win?(computer, player)
    "computer"
  else
    "tie"
  end
end

def update_points(player_score, computer_score, winner)
  if winner == 'player'
    player_score += 1
  elsif winner == 'computer'
    computer_score += 1
  end
  return player_score, computer_score
end

def display_result(winner)
  if winner == 'player'
    prompt("You won this round!")
  elsif winner == 'computer'
    prompt("The computer won this round!")
  else
    prompt("It was a tie.")
  end
end

def display_score(player_score, computer_score)
  prompt("The current score is:\n\tPlayer: #{player_score}\n\tComputer: #{computer_score}")
end

loop do
  player_score = 0
  computer_score = 0
  winner = ''
  prompt('Welcome to Rock Paper Scissors Lizard Spock!')
  prompt('The first player to 5 wins is the grand champion!')
  loop do
    choice = ''
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}")
      input_choice = Kernel.gets().chomp()

      INPUT_CHOICES.each do |word, acceptable_input|
        if acceptable_input.include?(input_choice)
          choice = word
        end
      end

      if input_choice == 's'
        choice = return_correct_s()
      end

      break unless choice.empty?()
      prompt("That's not a valid choice")
    end

    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice};  Computer chose: #{computer_choice}")

    winner = return_winner(choice, computer_choice)

    player_score, computer_score = update_points(player_score, computer_score, winner)

    display_result(winner)

    display_score(player_score, computer_score)

    break if player_score == 5 || computer_score == 5
  end
  prompt("The #{winner.capitalize()} has won the match!")

  prompt("Do you want to play again? Press Y to play again.")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt('Thank you for playing! Goodbye!')
