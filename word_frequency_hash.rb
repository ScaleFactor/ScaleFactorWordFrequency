# Author : Daniel Croy
# Date : 07/15/17
# Word Frequency Hash

if ARGV.length != 1
	puts "Incorrect number of arguments."
	puts "Usage: ruby word_frequency_hash.rb \"InputFile.txt\"\n"
	exit
end

file_name = ARGV[0]

begin
	file = File.open(file_name, "r")
rescue Errno::ENOENT # ENOENT is the error number thrown when the specified file does not exist
	puts "File: \"#{file_name}\" does not exist."
	puts "Please make sure you are opening the correct file.\n"
	exit
end
	
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

file.close()

longest_word = counter.keys.max_by {|word| word.length} # this value is used to left-justify each word according to the length of the longest word
counter.each do |word, count|
	puts "#{word}".ljust(longest_word.length) + " : #{count}"
end



