require 'gosu'

class CardWindow < Gosu::Window
  def initialize
    super 850, 500
    self.caption = "Ruby Card Demo - Bart & Safa"
    @font = Gosu::Font.new(18)
    @title_font = Gosu::Font.new(24, bold: true)
  end

  def draw
    draw_rect(0, 0, 850, 500, Gosu::Color::WHITE)
    
    # Bart's kaart
    draw_card(50, 50, "[1] Bart", "( o_o )", "<\\|/>", "/   \\", "HP: 25  POW: 10", "\"Let's code!\"")
    
    # Safa's kaart
    draw_card(450, 50, "[2] Safa", "( ^_^ )", "<\\|/>", "/   \\", "HP: 22  POW: 12", "\"Game on!\"")
    
    # Instructies
    @font.draw_text("Druk ESC om te sluiten", 320, 420, 1, 1, 1, Gosu::Color::BLACK)
  end
  
  def draw_card(x, y, name, face, body, legs, stats, quote)
    # Border
    draw_rect(x, y, 200, 300, Gosu::Color::BLACK)
    draw_rect(x+3, y+3, 194, 294, Gosu::Color::WHITE)
    
    # ID en Naam
    @title_font.draw_text(name, x+10, y+10, 1, 1, 1, Gosu::Color::BLACK)
    
    # Lijn
    draw_rect(x+10, y+45, 180, 2, Gosu::Color::BLACK)
    
    # ASCII Art
    @font.draw_text(face, x+70, y+80, 1, 1, 1, Gosu::Color::BLACK)
    @font.draw_text(body, x+75, y+105, 1, 1, 1, Gosu::Color::BLACK)
    @font.draw_text(legs, x+75, y+130, 1, 1, 1, Gosu::Color::BLACK)
    
    # Stats
    @font.draw_text(stats, x+10, y+180, 1, 1, 1, Gosu::Color::BLACK)
    
    # Quote
    @font.draw_text(quote, x+10, y+220, 1, 1, 1, Gosu::Color.new(0xff_000000))
  end
  
  def draw_rect(x, y, width, height, color)
    Gosu.draw_rect(x, y, width, height, color)
  end

  def button_down(id)
    close if id == Gosu::KB_ESCAPE
  end
end

window = CardWindow.new
window.show
