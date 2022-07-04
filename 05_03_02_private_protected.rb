class Parent
  def hello
    "Hi!"
  end

  def talk_to(other)
    other.goodbye
  end

  protected

  def goodbye
    "sEe yA!"
  end
end


class Child < Parent
end

mom = Parent.new
dad = Parent.new
kid = Child.new

# no workie
# puts kid.goodbye

puts mom.talk_to(dad)
puts mom.talk_to(kid)
puts kid.talk_to(dad)
