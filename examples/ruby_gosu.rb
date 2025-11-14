require 'gosu'

  $breedte = 850
  $hoogte = 500
  
class CardWindow < Gosu::Window

  def initialize

    

    super($breedte, $hoogte, fullscreen: true)
    self.caption = "Ruby Card Demo - Bart & Safa"
    @font = Gosu::Font.new(18)
    @title_font = Gosu::Font.new(24, bold: true)
    
    @bart_hp = 25
    @safa_hp = 22
    @turn = :bart  
  end

  def draw
    draw_rect(0, 0, $breedte, $hoogte, Gosu::Color::WHITE)
    
    draw_card(150, 50, "[1] Bart", "( o_o )", "<\\|/>", "/   \\", "HP: #{@bart_hp}  POW: 10", "\"Let's code!\"")
    
    draw_card(500, 50, "[2] Safa", "( ^_^ )", "<\\|/>", "/   \\", "HP: #{@safa_hp}  POW: 12", "\"Game on!\"")
    
    # knop
    button_x, button_y = 325, 370
    button_color = Gosu::Color.new(0xff_4CAF50)
    draw_rect(button_x, button_y, 200, 50, button_color)
    draw_rect(button_x+2, button_y+2, 196, 46, Gosu::Color.new(0xff_66BB6A))
    
    attacker_name = @turn == :bart ? "Bart" : "Safa"
    @title_font.draw_text("ATTACK!", button_x+50, button_y+13, 1, 1, 1, Gosu::Color::WHITE)
    
    if @bart_hp <= 0
      @title_font.draw_text("safa win", 385, 250, 1, 1, 1, Gosu::Color::RED)
    elsif @safa_hp <= 0
      @title_font.draw_text("bart win", 385, 250, 1, 1, 1, Gosu::Color::RED)
    else
      @font.draw_text("#{attacker_name} beurt druk voor attack", 320, 450, 1, 1, 1, Gosu::Color::BLACK)
    end
    
    @font.draw_text("Druk ESC om te sluiten", 330, 470, 1, 1, 1, Gosu::Color::BLACK)
  end
  
  def draw_card(x, y, name, face, body, legs, stats, quote)
    draw_rect(x, y, 200, 300, Gosu::Color::BLACK)
    draw_rect(x+3, y+3, 194, 294, Gosu::Color::WHITE)
    
    @title_font.draw_text(name, x+10, y+10, 1, 1, 1, Gosu::Color::BLACK)
    
    draw_rect(x+10, y+45, 180, 2, Gosu::Color::BLACK)
    
    @font.draw_text(face, x+70, y+80, 1, 1, 1, Gosu::Color::BLACK)
    @font.draw_text(body, x+75, y+105, 1, 1, 1, Gosu::Color::BLACK)
    @font.draw_text(legs, x+75, y+130, 1, 1, 1, Gosu::Color::BLACK)
    
    @font.draw_text(stats, x+10, y+180, 1, 1, 1, Gosu::Color::BLACK)
    
    @font.draw_text(quote, x+10, y+220, 1, 1, 1, Gosu::Color.new(0xff_800080))
  end
  
  def draw_rect(x, y, width, height, color)
    Gosu.draw_rect(x, y, width, height, color)
  end

  def button_down(id)
    close if id == Gosu::KB_ESCAPE
    
    # Klik
    if id == Gosu::MS_LEFT
      x, y = mouse_x, mouse_y
      
      # Check druk
      if x >= 325 && x <= 525 && y >= 370 && y <= 420
        attack
      end
    end
  end

  def attack
    return if @bart_hp <= 0 || @safa_hp <= 0
    
    if @turn == :bart
      @safa_hp -= 10
      @safa_hp = 0 if @safa_hp < 0
      @turn = :safa
    elsif @turn == :safa
      @bart_hp -= 12
      @bart_hp = 0 if @bart_hp < 0
      @turn = :bart
    end
  end
end

window = CardWindow.new
window.show
