# Author : Daniel Croy
# Date : 07/15/17
# Word Frequency Hash

if ARGV.length != 1
	puts "Incorrect number of arguments."
	puts "Usage: ruby wordFrequencyList.rb InputFile.txt\n"
	exit
end

fileName = ARGV[0]
file = File.open(fileName, "r")
counter = {}
while !file.eof?
	line = file.readline
	words = line.scan(/\w+'?\w*/)
	words.each do |word|
		if counter[word.downcase].nil?
			counter[word.downcase] = 1
		else
			counter[word.downcase] += 1
		end
	end
end
longest_word = counter.keys.max_by {|word| word.length}
counter.each do |word, count|
	puts "#{word}".ljust(longest_word.length) + " : #{count}"
end

