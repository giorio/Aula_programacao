def alphabetize (arr, rev=false)
    if rev
    	arr.reverse!
    else
	    arr.sort!
	end
end

numbers=[4,3,9,2,1,5,0]
alphabetize(numbers)
puts numbers
