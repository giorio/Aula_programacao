#atividade
#codigo pronto

puts "Entre com o texto: "
text = gets.chomp

words = text.split(" ")
frequencies = Hash.new(0)
words.each { |word| frequencies[word] += 1 }
frequencies = frequencies.sort_by {|a, b| b }
frequencies.reverse!
frequencies.each { |word, frequency| puts word + " " + frequency.to_s }

#meu codigo

puts "Entre com um texto:"
text=gets.chomp

words=text.split

frequencies=Hash.new(0)

words.each {|word| frequencies[words] += 1}

frequencies=frequencies.sort_by {|word, count| count}

frequencies.reverse!

frequencies.each do |word, count|
	puts word + " " + count.to_S
end
