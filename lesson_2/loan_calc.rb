#loan_calc.rb

=begin
inputs - user
  loan amount
  APR 
  loan duration 

outputs - sys 
  mth_interest_rate = 0
  mth_l_duration = 0
=end 

def msg_to_user(msg)
  puts "=> #{msg}"
end

#Calculator main
loop do 
  msg_to_user "Welcome to the Loan Calculator\n"
 
  #loan amount request, input & validation 
  msg_to_user "Please enter loan amount"

  loan_amount = ""
  loop do 
    loan_amount = gets.chomp
      if loan_amount.empty? || loan_amount.to_f < 0
        msg_to_user "Please enter a positive numeric amount."
      else 
        break
      end
  end

  #APR amount request, input & validation
  msg_to_user "Please enter the interest rate % (numbers only)"

  interest_rate = ""
  loop do
    interest_rate = gets.chomp
      if interest_rate.empty? || interest_rate.to_f < 0
        msg_to_user "Please enter a positive numeric amount."
      else
        break
      end
  end

  #loan duration request, input and validation
  msg_to_user "please enter loan duration in months"

  loan_duration = gets.chomp
  loop do
    if loan_duration.empty? || loan_duration.to_f < 0
      msg_to_user "Please enter positive numeric amount"
    else
      break
    end
  end

  #Calculations 
  apr = interest_rate.to_f / 100
  mth_interest_rate = apr / 12
  loan_duration = loan_duration.to_i

  mth_payment = loan_amount.to_f *
                (mth_interest_rate /
                (1- (1+ mth_interest_rate)**(-loan_duration)))

  
  #Output
  msg_to_user "Your monthly payment is: £#{format('%02.2f',mth_payment)}\n"

  # loan calculation request, input and validation
  msg_to_user "Perform a new loan calculation?"

  new_calc = ""
  options = ["y","n"]
  loop  do
    new_calc = gets.chomp.downcase
    if new_calc.empty?() || options.include?(new_calc) == false
      msg_to_user "please answer Y or N"
    else 
      break
    end
  end

  break unless new_calc.downcase.start_with?('y')
end

msg_to_user "Thank you for using the Loan Calculator!"
msg_to_user "Good bye!"

























