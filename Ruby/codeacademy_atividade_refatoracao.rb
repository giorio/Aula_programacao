$VERBOSE = nil    # Vamos explicar isso no final da lição.
require 'prime'   # Isso é um modulo. Vamos abordá-lo em breve!

def first_n_primes(n)

  
  return "n deve ser um inteiro." unless n.is_a? Integer

  return "n deve ser maior que 0." if n <= 0

  prime_array ||= []
  
  prime = Prime.new

  n.times {prime_array << (prime.next)}

  prime_array
end

first_n_primes(10)
