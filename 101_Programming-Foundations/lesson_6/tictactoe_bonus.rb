# rubocop:disable Metrics/LineLength

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +    # winning rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] +    # winning columns
                [[1, 5, 9], [3, 5, 7]]                 # winning diagonals
INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WHO_FIRST = 'choose'

def prompt(mess)
  puts "=> #{mess}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  puts "You're an #{PLAYER_MARKER}. Computer is an #{COMPUTER_MARKER}"
  puts ""
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
  puts ""
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def first_player
  ans = ''
  loop do
    prompt "Who do you want to go first, 1) you or 2) the computer? Enter the appropriate number."
    ans = gets.chomp
    break if ['1', '2'].include?(ans)
    prompt "That is not a valid choice."
  end
  if ans == '1'
    return 'player'
  else
    return 'computer'
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

def joinor(arr, divider=', ', ending='or')
  case arr.length
  when 1
    arr.first
  when 2
    arr.join(" #{ending} ")
  else
    arr[-1] = "#{ending} #{arr[-1]}"
    arr.join(divider)
  end
end

def place_piece!(board, current_player)
  case current_player
  when 'player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def player_places_piece!(board)
  square = ''

  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))})"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that is not a valid choice."
  end

  board[square] = PLAYER_MARKER
end

def threat(board)
  WINNING_LINES.each do |line|
    if board.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 2 &&
       board.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      square_of_threat = line[board.values_at(*line).find_index(' ')]
      return true, square_of_threat
    end
  end
  return false, nil
end

def detect_winning_move(board)
  WINNING_LINES.each do |line|
    if board.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 2 &&
       board.values_at(line[0], line[1], line[2]).count(INITIAL_MARKER) == 1
      winning_square = line[board.values_at(*line).find_index(' ')]
      return true, winning_square
    end
  end
  return false, nil
end

def computer_places_piece!(board)
  can_win, winning_square = detect_winning_move(board)
  danger, danger_square = threat(board)
  if can_win
    board[winning_square] = COMPUTER_MARKER
  elsif danger
    board[danger_square] = COMPUTER_MARKER
  elsif board[5] == ' '
    board[5] = COMPUTER_MARKER
  else
    square = empty_squares(board).sample
    board[square] = COMPUTER_MARKER
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def display_points(player_score, computer_score)
  prompt "Player Score: #{player_score}   -   Computer Score: #{computer_score}"
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(line[0], line[1], line[2]).count(PLAYER_MARKER) == 3
      return "Player"
    elsif board.values_at(line[0], line[1], line[2]).count(COMPUTER_MARKER) == 3
      return "Computer"
    end
  end
  nil
end

def match_winner?(player_score, computer_score)
  if player_score == 5
    true
  elsif computer_score == 5
    true
  else
    false
  end
end

loop do
  prompt "Welcome to Tic-Tac-Toe"
  prompt "The winner will be the first to 5 wins"
  prompt "Press any button to continue"
  gets

  starter = WHO_FIRST
  if starter == 'choose'
    starter = first_player
  end

  player_score = 0
  computer_score = 0
  winner = ''
  loop do
    board = initialize_board
    display_board(board)
    current_player = starter
    loop do
      display_board(board)
      place_piece!(board, current_player)
      current_player = alternate_player(current_player)
      break if someone_won?(board) || board_full?(board)
    end

    display_board(board)

    if someone_won?(board)
      prompt "#{detect_winner(board)} won!"
      if detect_winner(board) == "Player"
        player_score += 1
      else
        computer_score += 1
      end
    else
      prompt "It's a tie!"
    end

    if match_winner?(player_score, computer_score)
      winner = detect_winner(board)
      break
    else
      display_points(player_score, computer_score)
      prompt "Push enter for next round."
      gets
    end
  end

  prompt "\nThe winner of the match is #{winner}!!!\n"
  prompt "Would you like to play again? (Y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt "Thanks for playing Tic-Tac-Toe! Goodbye!"
