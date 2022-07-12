# Notes on "The Well-Grounded Rubyist"

The following is my personal opinion and experience. Just some things to keep in mind while learning Ruby for the purposes of being a Rails developer.

Most Rails application code falls into one of two categories:

1. CRUD operations on database records, typically represented as ActiveModel objects
2. Implementation of business/domain logic

This code will typically be very simple and use only a fraction of what Ruby can do. Maintainability, comprehensibility, and simplicity are key virtues.

You will typically not be writing your own iterators, passing lambdas around, doing manual threading, modifying the behavior of core Ruby or Rails classes, etc.

However, you will *encounter* many of those concepts just by working with ActiveRecord code and iterating through results.

You will be more likely to start using many of those concepts directly if/when you move into more "systems level" Rails work, or if you write standalone Ruby applications. It's amazing how beautiful and powerful small, standalone Ruby applications can be sometimes.

**Regardless of which parts of Ruby you actually use, it's not a big language. It's possible, and desirable, to at least know "which tools are in the drawer" even if you might not be using some of right away.**
