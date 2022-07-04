# frozen_string_literal: true

module Stacklike
  def stack
    @stack ||= []
  end

  def add_to_stack(obj)
    stack.push(obj)
  end

  def take_from_stack
    stack.pop || "empty!"
  end
end

class Stack
  include Stacklike
end

foo = Stack.new

foo.add_to_stack("Apple")
puts foo.take_from_stack
puts foo.take_from_stack
