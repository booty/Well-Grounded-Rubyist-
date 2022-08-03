# frozen_string_literal: true

# Returns a boolean
puts /hello/i.match?("Hello, have we met?")

# Returns string index of first match (13 in this case)
puts "Have we said hello before?" =~ /hello/

# Returns nil
puts "Zzzz" =~ /hello/

# Returns MatchData object
md = /(hello)/i.match("You say goodbye, and I say hello. Hello hello hello! I don't know why you say goodbye, I say hello")

# Returns ["hello"] (just the first one)
puts md.captures

line = "first_name=david;last_name=black;country=usa"
data = []
record = Hash[*line.split(/=|;/)]
data.push(record)
puts data