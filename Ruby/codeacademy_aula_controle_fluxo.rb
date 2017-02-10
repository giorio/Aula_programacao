#if
if true
    puts "Hoje é sexta!"
end

#if/else
if false
    puts "Hoje é sexta!"
else
    puts "Ainda não estou de férias"
end

#elsif
puts "Digite um número para X?"
num_x = gets.chomp
puts "Digite um número para Y?"
num_y = gets.chomp

if num_x > num_y
    puts "X é maior que Y"
elsif num_x < num_y
    puts "X menor que Y"
else
    puts "X igual a Y"
end

#unless - faz algo que seja falso.
hungry = false

unless hungry
  puts "Estou escrevendo programas em Ruby!"
else
  puts "Hora de comer!"
end

#igual ou não
is_true = 2 != 3

is_false = 2 == 3

#menor que ou maior que
test_1 = 17 > 16

test_2 = 21 < 30

test_3 = 9 >= 9

test_4 = -11 <= 4
