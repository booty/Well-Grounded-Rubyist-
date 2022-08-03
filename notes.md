## Part 1: Ruby Foundations


### 1.2 Anatomy of the Ruby Installation

`irb --simple-prompt`  ...didn't know about this

`irb --simple-prompt -r rbconfig`  hmmm, OK - enables `RbConfig::CONFIG`

`RbConfig::CONFIG` contains the expected: installation dirs, Unicode version, compilation options, shell info, etc.

#### 1.2.4 Sidebar: Working with multiple versions of Ruby

When installing multiple versions of Ruby (with `rbenv`, etc):

`"When you install the next version of the language, Ruby will check first to see which of the gems are installed. If, for example, it sees that a minimum acceptable version of rake is already installed, it won’t proceed to install another rake gem"`

Questions: Doesn't this lead to problems? Is this even remotely justified by the disk space savings? Can this be disabled?

#### 2.5.1 References / Immediate Values

Everything is a reference, except:

- integers
- symbols
- true, false, nil

**Interview question alert:** This is why Ruby doesn't have prefix/postfix operators (ie: `x=1; x++`)

### 2.5.3 #clone vs. #dup

What's the difference?

**Interview question alert:** #clone is like #dup, but if you #clone a frozen object the clone is also frozen.

### 3.5.3 BasicObject

Ancestor of `Object` ...the ultimate top of the hierarchy. Has only 8 instance methods, not 58 like `Object`.

Why would I ever use this?

```
 It’s mainly handy for situations where you’re modeling objects closely to some particular domain, almost to the point of writing a kind of Ruby dialect, and you don’t want any false positives when you send messages to those objects. The 58 methods can get in the way, if you have your own ideas about whether your objects should play dumb when you send them messages like #display, #extend, or #clone. (There’ll be more to say about this when we take up the topic thread of BasicObject in chapter 13.)
```

### 3.6 Classes are Objects

Classes have their own methods, state, identity.

### 3.6.5 Method Notation

`Ticket::most_expensive` is the same as `Ticket.most_expensive` (except, `::` is just for class methods

### 4.2 Method Lookup Chain

0. self, basically
1. Does my class define it?
2. Any mixins define it?
3. Parent class define it?
4. Parent class mixin define it?
5. (All the way up to BasicObject)

### 6.1.3 Case Statements, Equality Comparisons

I forgot the switches use `===` and not `==`

`===` typically defaults to `==` unless you have overridden it

`eql?` is true if `obj` and `other` refer to the same hash key. For others, synonymous with `==` usually. Some exceptions....

`Numeric` types perform type conversion across `==` but not `eql?` -- `1==1.0` is true, but `1.eql?(1.0)` is false.

`equal?` is for identity and should not be overridden. Essentially, pointer comparison.

### 7.4.1 to_*, to_s

`#to_s`

  this is what string interpolation uses

`#inspect`

  "born to be overridden" - by default, it is nearly useless

`#display`

  lol what

`#to_str`

  should return stringlike object, not just a string representation

### 7.6.1 Equality Tests


### 9.0 Collection and Container Objects

"Ruby implements collections principally through the technique of defining classes that mix in the Enumerable module"

### 11.0 Regular Expressions and Regexp-Based String Operations

```ruby
# Returns a boolean
puts /hello/i.match?("Hello, have we met?")

# Returns string index of first match (13 in this case)
puts "Have we said hello before?" =~ /hello/

# Returns nil
puts "Zzzz" =~ /hello/

# Returns MatchData object. This is the full-fat result,
# with named capture groups, etc.
md = /(hello)/i.match("You say goodbye, and I say hello. Hello hello hello! I don't know why you say goodbye, I say hello")

# You can do some string interp when defining a regex
str = "def"  # => "def"
/abc#{str}/  # => /abcdef/
```

### 11.7 Common Methods That Use Regular Expressions


#### 11.7.1 String#scan

`String#scan` returns an array of matches.

```ruby
regex = /\s(?<food>\w*?)[,.]/
string = "I ate vegetables, hamburgers, and pizza."

# Returns ["vegetables", "hamburgers", "pizza"]
string.scan(regex).flatten
```

If you use capture groups with `String#scan`, the results will be grouped.

```ruby
str = "Leopold Auer was the teacher of Jascha Heifetz."
  # => "Leopold Auer was the teacher of Jascha Heifetz."
>> violinists = str.scan(/([A-Z]\w+)\s+([A-Z]\w+)/)
  # => [["Leopold", "Auer"], ["Jascha", "Heifetz"]]
```

`String#scan` can optionally accept a code block.

💡Each iteration's results are discarded immediately, which can save a lot of memory if you are iterating through a huge piece of input text.

```ruby
str.scan(/([A-Z]\w+)\s+([A-Z]\w+)/) do |fname, lname|
  puts "#{lname}'s first name was #{fname}."
end
```

### 11.7.2 String#split

Simple case.

```ruby
line = "first_name=david;last_name=black;country=usa"
record = line.split(/=|;/)
  # => ["first_name", "david", "last_name", "black", "country", "usa"]
```

Or, read it directly into a hash.

```ruby
data = []
record =
     Hash[*line.split(/=|;/)]
data.push(record)
  # => {"first_name"=>"david", "last_name"=>"black", "country"=>"usa"}
```

Optional parameter to limit the number of items returned.

```ruby
"a,b,c,d,e".split(/,/,3)
  # => ["a", "b", "c,d,e"]
```

### 11.7.4 Not the Title of This Section But Hey, Enumerable#grep Exists

```ruby
["USA", "UK", "France", "Germany"].grep(/[a-z]/)
  # => ["France", "Germany"]
```

Also takes a code block while we're at it.

```ruby
["USA", "UK", "France", "Germany"].grep(/[a-z]/) {|c| c.upcase }
  # => ["FRANCE", "GERMANY"]
```

## 13 Object Individuation

### 13.1 Singleton Methods

Define a singleton method directly on an individual object.

```ruby
obj = Object.new
def obj.talk
  puts "Hi!"
end
obj.talk
```

Most common type of singleton is actually class methods - they're methods added to `Class` objects on an individual basis.

```ruby
class Car
  def self.makes
    %w{Ford Honda Rolls-Royce}
  end
end
```


Simple singletons.

```ruby
obj = Object.new
def obj.talk
  puts "Hi!"
end
obj.talk
```

Most common type of singleton is actually class methods!

```ruby
class Car
  def self.makes
    %w{ Honda Ford Toyota Chevrolet Volvo }
  end
end
```

Each object ultimately has two classes:

1. The class of which it's an instance
2. Its singleton class

Two ways to define methods on a singleton class.

`<< object` notation means the anonymous, singleton class of `object`

```ruby
str = "Hello"
class << str
  def twice
    self + " " + self
end end
puts str.twice
  # => Hello Hello
```

Equivalent to this:

```ruby
def str.twice
  self + " " + self
end
```

Only difference is constant resolution.

```ruby
N=1
obj = Object.new
class << obj
  N=2
end

def obj.a_method
  puts N
end

class << obj
  def another_method
    puts N
  end
end

obj.a_method         # => 1  (the outer level N)
obj.another_method   # => 2  (the N belonging to singleton class)
```


## 14 Callable and Runnable Objects

Main callable objects:

- `Proc` objects
- lambdas
- method objects

### 14.1 Basic Anonymous Functions: the Proc Class

Procs:

- Self contained code
- You can pass around, store, etc
- Pass as method objects
- Execute with `#call`

```ruby
# The most basic Proc.
pr = Proc.new { puts "I'm a basic proc." }
pr.call

# Same thing; this is the preferred syntax
pr2 = proc { puts "I'm a basic proc too." }
pr2.call
```

Procs vs. Blocks

- You always create `Procs` with a block
- But not every block becomes a proc
- Objects?
  - `Procs` are objects
  - A block is not an object


```ruby
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
%w{ John Booty }.each(&p)
```

Hash#to_proc

```ruby
puts "Albums from 2015: " + albums[2015]
  # => "To Pimp a Butterfly"

puts [1988, 1993].map(&albums)
  # => ["Straight Outta Compton", "Midnight Marauders"]

puts (2000..2100).map(&albums).compact
  # => ["Madvillainy", "To Pimp a Butterfly"]
```

Symbol#to_proc

```ruby
%(john booty).map(&:capitalize)
```













