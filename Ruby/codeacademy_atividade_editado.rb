#atividade
#codigo pronto

puts "Texto para fazer a busca: "
text = gets.chomp
puts "Palavra para editar: "
redact = gets.chomp
#atividade
#codigo pronto

puts "Texto para fazer a busca: "
text = gets.chomp
puts "Palavra para editar: "
redact = gets.chomp

words = text.split(" ")

words.each do |word|
  if word != redact
    print word + " "
  else
    print "REDACTED "
  end
end

#meu codigo
puts "Digite um texto!"
text = gets.chomp
puts "Palavra para pesquisa"
redact = gets.chomp

words = text.split(" ")

words.each do |palavra|
	if palavra == redact
		print "REDACTED "
	else
		print palavra + " "
	end
end
words = text.split(" ")

words.each do |word|
  if word != redact
    print word + " "
  else
    print "REDACTED "
  end
end

#meu codigo
puts "Digite um texto!"
text = gets.chomp
puts "Palavra para pesquisa"
redact = gets.chomp

words = text.split(" ")

words.each do |palavra|
	if palavra == redact
		print "REDACTED "
	else
		print palavra + " "
	end
end
