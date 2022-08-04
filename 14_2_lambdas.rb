# frozen_string_literal: true

lambda { puts "I'm a gosh darn lamba! ...or am I?" }

# Same thing, but with the preferred stabby syntax
my_lam = -> { puts "I'm a gosh darn lamba! ...or am I?" }
puts my_lam.class # => Proc

puts -> { puts "42" }.class