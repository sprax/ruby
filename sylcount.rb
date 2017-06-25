#!/usr/bin/env ruby
# Test against the word lists in: https://github.com/sprax/wordsbysyllables
# sprax 2017.06

cases = 0
correct = 0

s = "->s{s.scan(/[aiouy]+e*|e(?!d$|ly).|[td]ed|le$/).size}"

f = eval s

for i in 1 ... 8
    filepath = i.to_s + "-syllable-words.txt"
    file = File.open(filepath)

    while (line = file.gets)
        word = line.strip
        cases += 1
        if f.call(word) == i
            correct += 1
        end
    end
end

p "Correct: #{correct}/#{cases}, Length: #{s.length}, Score: #{correct - s.length*10}"

