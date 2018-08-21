GAME_CHOICES = %w(rock paper scissors spock lizard)
shortcut_choices = %w(r p s sp l)
display_choices = GAME_CHOICES.map.with_index { |x, i| x + '['+ shortcut_choices[i] +']' }
VALID_CHOICES = %w(rock paper scissors spock lizard r p s l)


player_score = 0
computer_score = 0

def msg_to_user(msg)
  puts "=> #{msg}"
end

 
loop do
  player_choice = ''

  # user prompt,request and validation
  loop do
    msg_to_user("Please choose one: #{display_choices.join(', ')}")
    player_choice = gets.chomp
    
    player_choice = case player_choice 
      when 'r'
        player_choice = 'rock'
      when 'p'
        player_choice = 'paper'
      when 's'
        player_choice = 'scissors'
      when 'sp'
        player_choice = 'spock'
      when 'l'
        player_choice = 'lizard'
      else
        player_choice = player_choice
      end

    if VALID_CHOICES.include?(player_choice)
      break
    else
      msg_to_user "that is not a valid choice."
    end
  end

  computer_choice = VALID_CHOICES[0..4].sample()

  puts "You chose #{player_choice}; Computer chose #{computer_choice}"

 
  if  player_choice == ('rock' || 'spock') && computer_choice == 'scissors' ||
      player_choice == ('paper' || 'spock') && computer_choice == 'rock' ||
      player_choice == ('scissors' || 'lizard') && computer_choice == 'paper' ||
      player_choice == 'lizard' && computer_choice == 'spock'
        msg_to_user "You won!"
        player_score += 1
  elsif player_choice == computer_choice
        msg_to_user "You draw"
  else
      msg_to_user "You lose"
      computer_score += 1
  end

  if player_score > 4
    msg_to_user "You are the Grand Champion!"
    player_score = 0
    computer_score = 0
  elsif computer_score > 4
    msg_to_user "Computer is the Grand Champion!"
    player_score = 0
    computer_score = 0
  else
    msg_to_user "Player score is: #{player_score}\n Computer score is: #{computer_score}"
  end

  msg_to_user "Do you want to play again? (y/n)"
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

msg_to_user "Thanks for playing rock paper scissors!"
