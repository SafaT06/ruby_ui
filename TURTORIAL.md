🚀 Ruby + Gosu Project Setup (Tutorial)

Volg deze stappen om een nieuw Ruby + Gosu project op te zetten.

1. Installeer Ruby (indien nog niet aanwezig)
   **macOS (Homebrew):**

```bash
   brew install ruby
```   

2. Installeer Gosu’s systeemdependencies
   **macOS (Homebrew):**

```bash
   brew install sdl2 sdl2_image sdl2_mixer sdl2_ttf
```

**Windows:**
Ga naar de [RubyInstaller](https://rubyinstaller.org) website.
Download de laatste versie van Ruby + Devkit.
Controleer de installatie in een terminal met:
```bash
ruby -v
```


3. Installeer bundler
Open een terminal in de folder waar je je project wilt hebben (bijv. ruby_ui) en voer uit:

```bash
  cd ruby_ui/
  gem install bundler
```

4. Maak een nieuw project
Vervang <projectnaam> door de naam van je project.
```bash
   bundle gem <projectnaam>
```

5. Vervang je Gemfile door:

```Ruby
# frozen_string_literal: true

source "https://rubygems.org"

# Specify your gem's dependencies in ruby_ui.gemspec
gemspec

gem "irb"
gem "rake", "~> 13.0"
gem "rubocop", "~> 1.21"
gem "gosu", "~> 1.4"
```

6. Installeer dependencies

```bash
  cd <projectnaam>
  bundle install 
```

download deze vs code extension
https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop

---

### Gosu (deze)

- gem install gosu (voor gui?? mag dit??? is een 2d game development library) (WINDOWS)


- brew install gosu
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