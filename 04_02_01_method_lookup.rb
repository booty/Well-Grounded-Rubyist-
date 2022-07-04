# frozen_string_literal: true

module Parent1Module
  def hello
    "Parent1Module hello #{self.class}"  # self is ParentClass, or whichever class included this mixin
  end
end

module Parent2Module
  def hello
    "Parent2Module hello #{self.class}"  # self is ParentClass, or whichever class included this mixin
  end
end

class ParentClass
  include Parent1Module
  include Parent2Module

  def hellox
    "ParentClass hello #{self.class}"
  end
end

my_parent = ParentClass.new

puts my_parent.hello

def my_parent.hello
  "whoa"
end

puts my_parent.hello
