# frozen_string_literal: true

my_string = "My string"
old_macdonald = "Old Macdonald had a farm!"

# Searching strings w/ []
# Should probably just use #include or #start_with? instead, though

puts my_string["str"]                  # => "str"
puts my_string["zzz"]                  # => nil
puts old_macdonald[/[aeiou]/]          # => only returns "a", ignores rest
puts old_macdonald[/([aeiou])/]        # ditto

# Can get a count of matches
# Does not accept regexen, weirdly
# Does support ranges and negation

puts old_macdonald.count("a")        # 5 (counts all a's)
puts old_macdonald.count("abc")      # 6 (counts all a, b, c)
puts old_macdonald.count("a-c")      # 6 (counts a thru c -- ranges)
puts old_macdonald.count("^g-m") + old_macdonald.count("g-m") == old_macdonald.size

# Strings, symbols, and frozen strings

# Creates 10 different "your mom" strings
# as we can see by the different object id's
10.times do
  puts "your mom".object_id
end

# Only creates one symbol. under the hood,
# a symbol is sort of like an integer pointer
10.times do
  puts :your_mom.object_id
end

# A frozen string is a lot like a symbol in
# a lot of ways. only one "your mom" is created.
10.times do
  str = "your mom".freeze
  puts str.object_id
end

