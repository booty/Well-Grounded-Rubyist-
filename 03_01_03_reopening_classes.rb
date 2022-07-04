class Robot
  def say_hello
    "Hello!"
  end

  def beep
    "Boop!"
  end
end

bob = Robot.new

class Robot
  def say_hello
    "Modified hello!"
  end

  def say_goodbye
    "Goodbye!"
  end
end

sally = Robot.new

puts bob.say_hello    # "Modified hello!"
puts bob.say_goodbye  # "Goodbye!"
puts sally.beep       # "Boop!"
