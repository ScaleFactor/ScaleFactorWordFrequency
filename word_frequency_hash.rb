# Author : Daniel Croy
# Date : 07/15/17
# Word Frequency 

fileName = ARGV[0]
file = File.open(fileName, "r")
counter = {}
while !file.eof?
	line = file.readline
	words = line.scan(/\w+/)
	words.each do |word|
		if counter[word.downcase].nil?
			counter[word.downcase] = 1
		else
			counter[word.downcase] += 1
		end
	end
end
counter.each do |word, count|
	puts "#{word} : #{count}"
end

