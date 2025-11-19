- gem install bundler (in terminal)
- bundle gem ruby_ui

- bundle install

download deze vs code extension
https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop

---

### Gosu (deze)
- gem install gosu (voor gui?? mag dit??? is een 2d game development library) (WINDOWS)
- gem install gosu -- user -install (MAC OS)
https://www.rubydoc.info/gems/gosu/Gosu


**RuboCop** is a Ruby static code analyzer (a.k.a. `linter`) and code formatter. Out of the box it
will enforce many of the guidelines outlined in the community [Ruby Style
Guide](https://rubystyle.guide). Apart from reporting the problems discovered in your code,
RuboCop can also automatically fix many of them for you.

RuboCop is extremely flexible and most aspects of its behavior can be tweaked via various
[configuration options](https://github.com/rubocop/rubocop/blob/master/config/default.yml).

## Installation

**RuboCop**'s installation is pretty standard:

```sh
gem install rubocop
```

If you'd rather install RuboCop using `bundler`, add a line for it in your
`Gemfile` (but set the `require` option to `false`, as it is a standalone tool):

```rb
gem 'rubocop', require: false
```

RuboCop is stable between minor versions, both in terms of API and cop configuration.
We aim to ease the maintenance of RuboCop extensions and the upgrades between RuboCop
releases. All big changes are reserved for major releases.
To prevent an unwanted RuboCop update you might want to use a conservative version lock
in your `Gemfile`:

```rb
gem 'rubocop', '~> 1.81', require: false
```

See [our versioning policy](https://docs.rubocop.org/rubocop/versioning.html) for further details.

## Quickstart

Just type `rubocop` in a Ruby project's folder and watch the magic happen.

## Documentation

You can read a lot more about RuboCop in its [official docs](https://docs.rubocop.org).

### Bronnen

https://docs.rubocop.org/rubocop/1.81/index.html