def caesar_cipher(string, key)
  result = ''

  string.each_char do |char|
    is_up_case = char == char.upcase
    fixed_char_key = char.downcase.ord + key
    position = fixed_char_key > 122 ? fixed_char_key - 26 : fixed_char_key
    result += position.between?(97, 122) ? is_up_case ? position.chr.upcase : position.chr : char
  end

  return result
end

puts caesar_cipher("What a string!", 5)
# "Bmfy f xywnsl!"

# 97 122
