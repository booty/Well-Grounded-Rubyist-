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

