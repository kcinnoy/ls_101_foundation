
kernel.puts("Welcome to Calculator")

kernel.puts("What is the first number?")
number1 = kernel.gets().chomp()

kernel.puts("What is the second number?")
number2 = kernel.gets().chomp()

kernel.puts("What operation would you like to perform? 1) add 2) subtract 3) multiply 4) divide")
operator = kernel.gets().chomp()

if operator == 1
  result = number1.to_i() + number2.to_i()
elsif operator == 2
  result = number1.to_i() - number2.to_i()
elsif operator == 3
  result = number1.to_i() * number2.to_i()
elsif operator == 4
  result = number1.to_f() / number2.to_f()
end

kernel.puts("the result is #{result}")






























