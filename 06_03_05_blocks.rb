class Integer
  def my_times
    counter = 0
    until counter == self
      yield counter
    end
  end
end

3.times { |x| puts "hello friend! (#{x}th iteration}" }

class Array
  def bootleg_each
    0.upto(size - 1) do |x|
      yield self[x]
    end
  end

  def bootleg_map
    new_array = Array.new(size)
    0.upto(size - 1) do |x|
      new_array[x] = yield(self[x])
    end
    new_array
  end
end

[2, 4, 6, 8].bootleg_each { |x| puts "value is #{x}" }
puts "who do we appreciate?"

puts ["apple", "banana", "celery"].bootleg_map { |x| x * 2 }
