# Notes on "The Well-Grounded Rubyist"

I've been working with Ruby for a number of years.

At my day job, we've selected "The Well-Grounded Rubyist" as part of our curriculum for those are are not new to development... but are new to Ruby.

So I've decided to work through the book myself.

I'll be taking fairly sparse notes, not comprehensive ones. They'll mainly consist of:

1. Concepts on which I was previously fuzzy
2. Things I'm learning for the first time
3. Things I think will be especially useful for our "students"
4. Things I think won't be useful for our "students"

## Running Code

It's very convenient to iterate quickly with Sublime's built-in Build shortcut (Cmd + B), but I always forget how to set this up so I'll put it here.

By default, Sublime will use MacOS' default Ruby version.

To make it play with `asdf` (instructions for `rbenv` are similar):

In `~/Library/Application Support/Sublime Text/Packages/User/RubyAsdf.sublime-build`

```json
{
  "cmd": ["/Users/john.rose/.asdf/shims/ruby", "$file"],
  "file_regex": "^(...*?):([0-9]*):?([0-9]*)",
  "selector": "source.ruby"
}
```

May also need this in `~/.zprofile`

```bash
. /usr/local/opt/asdf/libexec/asdf.sh
```