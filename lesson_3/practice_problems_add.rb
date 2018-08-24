
# q1
=begin
flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

new_flint = flintstones.each_with_object({}) do |name, hash| 
  hash.store(name,flintstones.index(name))
end 


flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

flintstones_hash = {}
flintstones.each_with_index do |name, index|
  flintstones_hash[name] = index
end



#Q2

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

sum = ages.values.sum

total_ages = 0
ages.each { |_,age| total_ages += age }
total_ages

=end


ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

ages.keep_if { |_, age| age < 100 }


flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.find do |name|
name.start_with?("Be")
end

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

flintstones.map do |name|
  name[0..2]
end

statement = "The Flintstones Rock"

statement.downcase.split(//).sort.each_with_object({}) do |char, hash|
hash.store(char[0],)
end


statement = "The Flintstones Rock"

statement.downcase.split(//).count { |char| char }


words = "The Flintstones Rock"
words.split.map { |word| word.capitalize }.join(' ')
