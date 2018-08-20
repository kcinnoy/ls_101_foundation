VALID_CHOICES = %w(rock paper scissors)

def msg_to_user(msg)
  puts "=> #{msg}"
end

def display_result (player, computer)
  if player == 'rock' && computer == 'scissors' ||
      player == 'paper' && computer == 'rock' ||
      player == 'scissors' && computer == 'paper'
        msg_to_user "You won!"
  elsif player == computer
        msg_to_user "You draw"
  else
        msg_to_user "You lose"  
  end
end

loop do
  choice = ''

  #user prompt, request and validation 
  loop do
    msg_to_user("Please choose one: #{VALID_CHOICES.join(', ')}")
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    else
      msg_to_user "that is not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES.sample


  puts "You chose #{choice}; Computer chose #{computer_choice}"

  display_result(choice, computer_choice)

  
  msg_to_user "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.starts_with?('y')
end

msg_to_user "Thanks for playing rock paper scissors!"
























