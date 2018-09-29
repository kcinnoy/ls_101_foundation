require 'pry'

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = winning_lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                [[1, 5, 9], [3, 5, 7]] # diagonals
GAME_WINNING_SCORE = 2

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter=', ', word='or')
  case arr.size
  when 0 then ''
  when 1 then arr.first
  when 2 then arr.join(" #{word} ")
  else
    arr[-1] = "#{word} #{arr.last}"
    arr.join(delimiter)
  end
end

def display_board(board_p, game_score)
  system 'clear'
  puts "Player Wins: #{game_score[:player_wins]}" 
  puts "Computer Wins: #{game_score[:computer_wins]}" 

  puts ""
  puts "     |     |     "
  puts "  #{board_p[1]}  |  #{board_p[2]}  |  #{board_p[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_p[4]}  |  #{board_p[5]}  |  #{board_p[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{board_p[7]}  |  #{board_p[8]}  |  #{board_p[9]}  "
  puts "     |     |     "
end

def board_m
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def player_move!(board_p)
  square = ''
  loop do
    prompt "Choose a square #{joinor(empty_squares(board_p), ', ')}:"
    square = gets.chomp.to_i
    break if empty_squares(board_p).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  board_p[square] = PLAYER_MARKER
end

def computer_move!(board_p)
  square = nil

  WINNING_LINES.each do |line| # defense 
    square = vulnerable_square(line, board_p, PLAYER_MARKER)
    break if square
  end

  if !square
    WINNING_LINES.each do |line| # offense
      square = vulnerable_square(line, board_p, COMPUTER_MARKER)
      break if square
    end 
  end

  if !square && empty_squares(board_p).include?(5)
    square = 5
  else
    square = nil
  end

  if !square
    square = empty_squares(board_p).sample
  end

  board_p[square] = COMPUTER_MARKER
end

def vulnerable_square(line, board_p, marker)
  if board_p.values_at(*line).count(marker) == 2
    board_p.select {|k,v| line.include?(k) && v == INITIAL_MARKER}.keys.first
  else
    nil
  end  
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd)
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def game_won_drawn (game_score)
  case 
  when game_score[:player_wins] == GAME_WINNING_SCORE
    return 'Player'
  when game_score[:computer_wins] ==  GAME_WINNING_SCORE
    return 'Computer'
  when game_score[:draws] == GAME_WINNING_SCORE
    return 'Draw'
  else
    false
  end
end

def display_game_result (game_score)
  case 
  when game_won_drawn(game_score) == 'Player' || game_won_drawn(game_score) == 'Computer'
     prompt "#{game_won_drawn(game_score)} wins the game!"
  when game_won_drawn(game_score) == 'Draw'
     prompt "The game is a draw!"
  else
     false
  end
end

def scoreboard (board_p, game_score)
  case detect_winner(board_p)
  when 'Player'
    game_score[:player_wins] +=1
  when 'Computer'
    game_score[:computer_wins] +=1
  else
    game_score[:draws] +=1
  end
end

def play_again? (game_score)
   unless game_score.any? {|_,v| v >= GAME_WINNING_SCORE}
    loop do
      prompt "play again (y/n)"
      answer = gets.chomp
      if answer.downcase == 'y'
        return true
      elsif answer.downcase == 'n'
        return false
      else
      prompt "Please enter (y/n)"
      end
    end
  end
end

loop do
  game_score = {player_wins: 0, computer_wins: 0, draws: 0}
  board_p = board_m
  display_board(board_p, game_score)

  loop do
    board_p = board_m
    display_board(board_p, game_score)

    loop do #game moves 
      display_board(board_p, game_score)
      player_move!(board_p)
      computer_move!(board_p)
      break if someone_won?(board_p) || board_full?(board_p)
    end

    scoreboard(board_p, game_score)
    display_board(board_p, game_score)

    if someone_won?(board_p)
      prompt "#{detect_winner(board_p)} won the round!"
    else
      prompt "It's a tie"
    end

    display_game_result(game_score)
    break unless play_again?(game_score)

  end
  break
end

prompt "Thanks for playing!"
