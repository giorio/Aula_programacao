#laço while

i = 0
while i < 5
    puts i
    i = i +1
end

#laço until

counter = 1
until counter < 10
  puts counter
  # Adicione o código para atualizar o contador 'counter' aqui!
  counter += 1
  
end

#laço for

for num in 1..15
  puts num
end

#laço for - atividade

for num in 1..20
	puts num
end

for num in 1...21
	puts num
end

#loop

i = 20
loop do
  i -= 1
  print "#{i}"
  break if i <= 0
end

#next

i = 20
loop do
  i -= 1
  next if i % 2 != 0
  print "#{i}"
  break if i <= 0
end

#array

my_array = [1,2,3,4,5]

#each

odds = [1,3,5,7,9]

# Adicione seu codigo abaixo!
odds.each do |x|
	print 2 * x
end

#times

5.times{print "Gustavo love bacon!"}

#revisao while
i=1
while i <= 50
	print i
	i += 1
end

#revisao until
i=1
until i==51
	print i
	i += 1
end

#revisao for

for i in 1..50
	print i
end

#revisao loop
r = "Ruby!"
m = 0
loop do
	m+=1
	print r
	break if m==30
end

#revisao times
30.times{print "Ruby!"}
