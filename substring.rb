def substrings(string, dictionary)
  response = Hash.new(0)

  dictionary.each do |word|
    count = string.scan(/\b#{word}\b/i).size
    response[word.downcase] = count if count > 0
  end

  response
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substrings("Howdy partner, sit down! How's it going?", dictionary)
