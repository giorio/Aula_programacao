#atividade
#codigo pronto

dmovies = {
  Memento: 3,
  Primer: 4,
  Ishtar: 1
}

puts "O que você gostaria de fazer?"
puts "-- Digite 'add' para adicionar um filme."
puts "-- Digite 'update' para atualizar um filme."
puts "-- Digite 'display' para mostrar todos os filmes."
puts "-- Digite 'delete' para deletar um filme."

choice = gets.chomp.downcase
case choice
when 'add'
  puts "Que filme você gostaria de adicionar?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Qual a nota? (Digite um número de 0 a 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} foi adicionado com uma nota de #{rating}."
  else
    puts "Esse filme já existe na lista! Sua nota é #{movies[title.to_sym]}."
  end
when 'update'
  puts "Que filme você gostaria de atualizar?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Filme não encontrado!"
  else
    puts "Qual é a nova nota? (Digite um número de 0 a 4.)"
    rating = gets.chomp
    movies[title.to_sym] = rating.to_i
    puts "#{title} foi atualizado, sua nova nota é #{rating}."
  end
when 'display'
  movies.each do |movie, rating|
    puts "#{movie}: #{rating}"
  end
when 'delete'
  puts "Que filme voce gostaria de deletar?"
  title = gets.chomp
  if movies[title.to_sym].nil?
    puts "Filme não encontrado!"
  else
    movies.delete(title.to_sym)
    puts "#{title} foi deletado."
  end
else
  puts "Desculpa, não entendo o que você quer."
end

#meu codigo
movies = {
	Godfather: 5,
	NeedForSpeed: 1,
	ResidentEvil: 1
}


puts "Digite o que quer fazer?"
puts "-- Digite 'add' para adicionar um filme."
puts "-- Digite 'update' para atualizar um filme."
puts "-- Digite 'display' para mostrar todos os filmes."
puts "-- Digite 'delete' para deletar um filme."
choice = gets.chomp.downcase

case choice
when "add"
    puts "Qual o nome do filme a ser cadastrado?"
    title = gets.chomp
    if movies[title.to_sym].nil?
	    puts "Qual é a sua avaliação desse filme de 1 a 5"
	    rating = gets.chomp
	    movies[title.to_sym]=rating.to_i
	else
		puts "O filme já está cadastrado."
	end
when "update"
    puts "Qual o nome do filme a ser atualizado?"
    title = gets.chomp
    if movies[title.to_sym].nil?
    	puts "O filme informado não está cadastrado ainda"
    else
    	puts "Qual é a sua avaliação desse filme de 1 a 5"
	    rating = gets.chomp
	    movies[title.to_sym]=rating.to_i
    end
when "display"
    movies.each do |movie, rating|
    	puts "#{movie}: #{rating}"
    end
when "delete"
	puts "Qual o nome do filme a ser deletado?"
    title = gets.chomp
    if movies[title.to_sym].nil?
    	puts "Filme não cadastrado"
    else
    	movies.delete(title.to_sym)
    end
else
    puts "Erro!"
end
