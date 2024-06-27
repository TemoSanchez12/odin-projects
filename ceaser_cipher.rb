def caesar_cipher(string, key)
  result = ''

  string.each_char do |char|
    is_up_case = char == char.upcase
    fixed_char = char.downcase
    position = fixed_char.ord + key > 122 ? fixed_char.ord + key - 122 + 96 : fixed_char.ord + key

    result += 97 <= position && position <= 122 ? is_up_case ? position.chr.upcase : position.chr : char
  end

  return result
end

puts caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"

# 97 122
