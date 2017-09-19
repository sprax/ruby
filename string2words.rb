# ruby
# Sprax Lines	2011 ?
# Usage: ruby -w string2words.rb words.txt rainrajatacozapsrakezarfabetrainzany

require 'optparse'

$debug = 1;
$WordCount = 0;
$MinWordLength =  2;
$MaxWordLength = 24;
$hDictionary = Hash.new


# Recursively divide a string into words, starting from the beginning.
# Returns parsed words in an array, else nil.
def string2wordsFromBeg(string, wordsAlreadyParsed=[])

  if ($debug > 1)
    puts "string2wordsFromBeg: string(#{string}) words(#{wordsAlreadyParsed})"
  end

  # If this string is a word, just return it with any words already parsed.
  if isWord(string)
    wordsAlreadyParsed.push(string)
    return wordsAlreadyParsed
  end

  # Else divide the string into two parts, and if the 2nd part is a word, keep going.
  # Use min and max word lengths to skip checking substrings that cannot be words.
  if  string.length >= $MaxWordLength + $MinWordLength
      maxLength      = $MaxWordLength;
  else
      maxLength = string.length - $MinWordLength;
  end
  length = $MinWordLength;
  while (length < maxLength)
    substr = string[0..length]
    length += 1
    if isWord(substr)
      wordsAlreadyParsed.push(substr)
      moreWords = string2wordsFromBeg(string[length..999], wordsAlreadyParsed)
      if  moreWords
        return moreWords
      end
    end
  end
  return nil          # string did not completely parse into words
end


# Recursively divide a string into words, backing up from the end.
# Returns parsed words in a string, separated by spaces, else nil.
def string2wordsFromEnd(string, wordsAlreadyParsed=nil)

  if ($debug > 1)
      puts "string2wordsFromEnd: string(#{string}) words(#{wordsAlreadyParsed})"
  end

  # If this string is a word, just return it with any words already parsed.
  if isWord(string)
    if wordsAlreadyParsed
      string += " " + wordsAlreadyParsed;
    end
      return string
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
      if wordsAlreadyParsed
        substr += " " + wordsAlreadyParsed;
      end
      moreWords = string2wordsFromEnd(string[0..maxIndex], substr)
      if moreWords
        return moreWords
      end
    end
  end
  return nil          # string did not completely parse into words
end


# Recursively divide a string into words, backing up from the end.
# Find all combinations.
# Returns parsed words in a string, separated by spaces, else nil.
def string2wordsFromEndAll(string, wordsAlreadyParsed=nil, allParses=[])

  if ($debug > 1)
    puts "string2wordsFromEnd: string(#{string}) words(#{wordsAlreadyParsed})"
  end

  # If this string is a word, just return it with any words already parsed.
  if  isWord(string)
    if wordsAlreadyParsed
      string += " " + wordsAlreadyParsed;
    end
    print string, "\n";
    allParses.push(string);
    return string
  else
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
        if wordsAlreadyParsed
          substr += " " + wordsAlreadyParsed;
        end
        string2wordsFromEndAll(string[0..maxIndex], substr)
    	end
    end
  end
  return allParses;
end


def string2AllWords(string, *wordsAlreadyParsed)
return nil
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
  puts "Loaded #{$WordCount} words from dictionary: #{fileName}.\n\n"
end

def append(arr, str)
	arr.push(str);
	arr
end

def testAppend
  wl = [];
  print wl, "     length: ", wl.length, "\n";
  wl.push("apple", "orange");
  print "wl.class: ", wl.class, "\n";
  print wl, "     length: ", wl.length, "\n";
  wl.push("pear");
  print wl, "     length: ", wl.length, "\n";
  append(wl, "banana");
  print wl, "     length: ", wl.length, "\n";
end

def main
    # testAppend
    loadDictionary(ARGV[0] || 'words.txt')
    inputString = ARGV[1] || 'extrainsanity'

    ret = string2wordsFromBeg(inputString)
    if ret == nil
      print inputString, " did not parse (left to right) completely into words\n"
    else
      print ret.length, " words LR: ", ret ? ret.join('  ') : '', "\n"
    end

    ret = string2wordsFromEnd(inputString)
    if ret == nil
      print inputString, " did not parse (right to left) completely into words\n"
    else
      wordCount = ret ? ret.count(" ") + 1 : 0
      print wordCount,  " words RL: ", ret ? ret : '', "\n";
    end

    print "string2wordsFromEndAll:\n"
    ret = string2wordsFromEndAll(inputString);
    print "All words: ", ret, "\n"

    if (ARGV[2])
        print "\n  isWord(arg2) == isWord(", ARGV[2], ") == ", isWord(ARGV[2])
    end
end

main
