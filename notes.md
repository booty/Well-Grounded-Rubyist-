## Part 1: Ruby Foundations


### 1.2 Anatomy of the Ruby Installation

`irb --simple-prompt`  ...didn't know about this

`irb --simple-prompt -r rbconfig`  hmmm, OK - enables `RbConfig::CONFIG`

`RbConfig::CONFIG` contains the expected: installation dirs, Unicode version, compilation options, shell info, etc.

#### 1.2.4 Sidebar: Working with multiple versions of Ruby

When installing multiple versions of Ruby (with `rbenv`, etc) - `"When you install the next version of the language, Ruby will check first to see which of the gems are installed. If, for example, it sees that a minimum acceptable version of rake is already installed, it won’t proceed to install another rake gem"`

Questions: Doesn't this lead to problems? Is this even remotely justified by the disk space savings? Can this be disabled?
