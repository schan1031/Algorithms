require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  hash = HashMap.new
  string.chars.each do |el|
    hash[el] = 0 unless hash.include?(el)
    hash[el] += 1
  end
  odd_count = 0
  hash.each do |k, v|
    return false if odd_count > 1
    odd_count += 1 if v == 1
  end
  true

end
