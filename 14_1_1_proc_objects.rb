# frozen_string_literal: true

# The most basic Proc.
pr = Proc.new { puts "I'm a basic proc." }
pr.call

# Same thing; this is the preferred syntax
pr2 = proc { puts "I'm a basic proc too." }
pr2.call

# There's a block here, but no proc
[1, 2, 3].each { |x| puts x * 10 }

# A method can capture a block, objectified into a proc
def call_a_proc(&foo)
  puts "call_a_proc: foo is a #{foo.class}"   # => it's a prod
  foo.call
end
call_a_proc { puts "I'm a block that becomes a Proc, rite?" }

# Proc can serve in place of a block
p = proc { |x| puts x.upcase }
%w{John Booty}.each(&p)

# Hash#to_proc - it's wild
albums = {
  1988 => "Straight Outta Compton",
  1993 => "Midnight Marauders",
  1996 => "The Score",
  2004 => "Madvillainy",
  2015 => "To Pimp a Butterfly"
}

puts "Albums from 2015: " + albums[2015]
  # => "To Pimp a Butterfly"

puts [1988, 1993].map(&albums)
  # => "Straight Outta Compton", "Midnight Marauders"

puts (2000..2100).map(&albums).compact