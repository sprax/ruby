# ruby
# Usage: ruby -w string2words.rb words.txt rainrajatacozapsrakezarfabetrainzany
 
$WordCount = 0;
$MinWordLength = 2;
$MaxWordLength = 6;
$hDictionary = Hash.new

# recursively divide a string into array of words, else return nil 
def string2words(string, *wordsAlreadyParsed)

    puts "string2words: string(#{string}) words(#{wordsAlreadyParsed})"

    # If the this string is a word, just return it with any words already parsed.
	if   isWord(string)
		return [string, wordsAlreadyParsed]
	end

    # Else divide the string into two parts, and if the 2nd part is a word, keep going.
    # Use min and max word lengths to skip checking substrings that cannot be words.
	maxIndex = string.length
	minIndex = maxIndex - $MaxWordLength
	if minIndex < 0 
	   minIndex = 0
	end
	maxIndex -= $MinWordLength;
	while (maxIndex > minIndex) 
		substr = string[maxIndex..999]
		maxIndex -= 1
		if isWord(substr)
			moreWords = string2words(string[0..maxIndex], substr, wordsAlreadyParsed)
			if moreWords
				return moreWords
			end
		end
	end
	return nil          # string did not parse
end

def isWord(string)
    return $hDictionary[string] ? true : false
end

def loadDictionary(fileName)
    File.open(fileName, "r") do |aFile|
        aFile.each_line do |line|
	        line.chomp!
	        size = line.length
	        # puts line, size
                $WordCount += 1;
                $hDictionary[line] = size
        end
    end
    #  $hDictionary.each do |key, value|
    #    print key, " is ", value, "\n"
    #    print key
    #  end
    puts "Total:  #{$WordCount} words.\n\n"
end

def main

    loadDictionary(ARGV[0])    
    ret = string2words(ARGV[1])
    print "(", ret ? ret.join('  ') : '', ")\n";
end



main

# class String
# def /(str_to_join)
# File.join(self, str_to_join)
# end
# end


