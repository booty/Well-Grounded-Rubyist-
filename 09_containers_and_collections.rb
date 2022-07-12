# frozen_string_literal: true

hash = { red: "ruby", white: "diamond", green: "emerald" }

# parens splat (?) the params
# otherwise key would be an array and i would be nil
hash.each_with_index do |(key, value), i|
  puts "Pair #{i} is: #{key}/#{value}"
end

# I always forget this one because it's weird and unintuitive
words = %w(John Edmund Rose\ Jr)
puts words

# Hashes as final method arguments
def create_jet(name, caps)
  puts "Name: #{name} ✈️ "
  puts "  Top speed: #{caps[:top_speed]}" if caps[:top_speed]
  puts "  Guns: #{caps[:guns]}" if caps[:guns]
  puts "  Style rating: #{caps[:style_rating]}" if caps[:style_rating]
end
create_jet("F-14", top_speed: "Mach 2", style_rating: "S+")

# Param->Array sponge
def create_

# Keyword->Hash sponge
def create_boat(name, **data)
  puts "Name: #{name} 🚢"
  puts data.each { |k,v| puts "  #{k}: #{v}" }
end
create_boat("Yamato", guns: "18 inch", useful: false)