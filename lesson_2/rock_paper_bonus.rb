VALID_CHOICES = %w(rock paper scissors spock lizard r p s l)


def msg_to_user(msg)
  puts "=> #{msg}"
end

 

def display_result(player, computer)
  player_score = 0
  computer_score = 0
 
  if  player == ('rock' || 'spock') && computer == 'scissors' ||
      player == ('paper' || 'spock') && computer == 'rock' ||
      player == ('scissors' || 'lizard') && computer == 'paper' ||
      player == 'lizard' &&  computer == 'spock'
        msg_to_user "You won!"
        player_score += 1
  elsif player == computer
        msg_to_user "You draw"
  else
        msg_to_user "You lose"
        computer_score += 1
  end
  msg_to_user "Player score is: #{player_score}\n Computer score is: #{computer_score} "
end

loop do
  choice = ''

  # user prompt,request and validation
  loop do
    msg_to_user("Please choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp
    
    choice = case choice 
    when 'r'
      choice = 'rock'
    when 'p'
      choice = 'paper'
    when 's'
      choice = 'scissors'
    when 'l'
      choice = 'lizard'
    else
      choice = choice
    end  

    if VALID_CHOICES.include?(choice)
      break
    else
      msg_to_user "that is not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES[0..4].sample()

  puts "You chose #{choice}; Computer chose #{computer_choice}"

  display_result(choice, computer_choice)

  msg_to_user "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

msg_to_user "Thanks for playing rock paper scissors!"
















