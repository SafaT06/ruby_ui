# Ruby UI
Small prototype to show that a simple text based UI is possible in ruby

## Korte uitleg ruby (GOSU, GLIMMER, RUBYFX, RUBYUI, WXRUBY3)
- gem install bundler in terminal
- bundle gem ruby_ui

### Gosu (deze)
- gem install gosu (voor gui?? mag dit??? is een 2d game development library) (WINDOWS)
- gem install gosu -- user -install (MAC OS)
https://www.rubydoc.info/gems/gosu/Gosu

### Glimmer (deze)
- gem install glimmer-dsl-libui (Yay)
https://www.rubydoc.info/gems/glimmer

### Wx Ruby (deze)
- gem install wxruby3
https://mcorino.github.io/wxRuby3/

### RubyFX REJECTED
- gem install fxruby (rejected doet niet veel debuggen nodig)

### Ruby UI (doet het ook niet) REJECTED
- cd ruby_ui en dan bundle add ruby_ui --group development --require false
- rails g ruby_ui:install


Doe even voor de zekerheid

| Criteria         | Gosu                                       | Glimmer                                  | WxRuby3                                   |
| ------------------ | -------------------------------------------- | ------------------------------------------ | ------------------------------------------- |
| **Documentatie** | + Uitgebreide docs, wiki, veel voorbeelden | + Goede docs                             | + Grote community                         |
| **Leercurve**    | + Simpel API, snel te leren                | Mwah ???                                 | - Complex API, veel classes               |
| **Visualisatie** | + Custom graphics, pixel-perfect (je kan zelf de pixels vertellen).          | - Beperkte custom drawing (geen kleuren) | + Native ingebouwde widgets (buttons etc) |

**Conclusie**: Gosu gekozen voor visuele controle en simpele API. EN EN voor games gemaakt dus win win situatie

