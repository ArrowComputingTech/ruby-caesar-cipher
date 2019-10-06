# Create alphabet.
i=0
alphabet = ("a".."z")
l_alphabet_map = {}
u_alphabet_map = {}
alphabet.each do |letter|
  i+=1
  l_alphabet_map[i] = letter
  u_alphabet_map[i] = letter.upcase
end

# Main program.
def caesar_cipher(cipher_string, rotate_value, l_alphabet_map, u_alphabet_map)
  return_cipher = ''
  cipher_string.split('') do |letter|
    if l_alphabet_map.has_value?(letter)
      return_cipher = return_cipher + (get_return_cipher(rotate_value, letter, l_alphabet_map))
    elsif u_alphabet_map.has_value?(letter)
      return_cipher = return_cipher + (get_return_cipher(rotate_value, letter, u_alphabet_map))
    else
      return_cipher = return_cipher + letter
    end
  end
  return return_cipher
end

def get_return_cipher(rotate_value, letter, alphabet_map)
      return_key = (alphabet_map.key(letter)).to_i + (reduce_rotate(rotate_value.to_i)).to_i
      return alphabet_map.fetch(return_key)
end

# Fix rotate_value.
def reduce_rotate(rotate_value)
  if rotate_value > 26
    rotate_value = rotate_value - 26
    return reduce_rotate(rotate_value)
  end
  return rotate_value
end

puts ("Give me a word or phrase to encode.")
cipher_string = gets.strip
puts ("Thanks. Give me a rotation value (number) with which to encode the phrase.")
rotate_value = gets.strip.to_i

# Make sure rotation value is valid.
if rotate_value < 0
  puts ('Invalid value. Valid values are 0-inf integers.')
else
  puts(caesar_cipher(cipher_string, rotate_value, l_alphabet_map, u_alphabet_map))
end
