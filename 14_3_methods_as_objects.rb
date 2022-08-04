# frozen_string_literal: true

class Foo
  def talk
    puts "My self is: #{self}"
  end
end
foo = Foo.new

# Method is still bound to Foo
tlk = foo.method(:talk)
tlk.call
puts tlk.owner # => Foo
puts tlk.class # => Method

# A child class
class FooChild < Foo; end
foo_child = FooChild.new

# Unbinding a method from Foo and rebinding it to FooChild
tlk_unbound = tlk.unbind
puts tlk_unbound.object_id       # => 60
puts tlk.object_id               # => 80 (not the same object)
tlk_unbound.bind(foo_child).call # => My self is: #<FooChild:0x000000010fef33e0>
