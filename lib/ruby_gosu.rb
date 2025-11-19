# frozen_string_literal: true

# rubocop:disable Metrics/AbcSize, Metrics/ParameterLists, Metrics/MethodLength

require 'gosu'

# CardWindow class for the Ruby Card Demo
class CardWindow < Gosu::Window
  SCREEN_WIDTH = Gosu.screen_width
  SCREEN_HEIGHT = Gosu.screen_height

  def initialize
    super(SCREEN_WIDTH, SCREEN_HEIGHT, fullscreen: true)
    self.caption = 'Ruby Card Demo - Bart & Safa'
    @font = Gosu::Font.new(18)
    @title_font = Gosu::Font.new(24, bold: true)

    @bart_hp = 25
    @safa_hp = 22
    @turn = :bart
  end

  def draw
    draw_rect(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, Gosu::Color::WHITE)

    card_y = SCREEN_HEIGHT / 4
    bart_x = (SCREEN_WIDTH / 2) - 250
    safa_x = (SCREEN_WIDTH / 2) + 50

    draw_card(bart_x, card_y, '[1] Bart', '( o_o )', '<\\|/>', '/   \\', "HP: #{@bart_hp}  POW: 10", '"Let\'s code!"')
    draw_card(safa_x, card_y, '[2] Safa', '( ^_^ )', '<\\|/>', '/   \\', "HP: #{@safa_hp}  POW: 12", '"Game on!"')

    button_x = (SCREEN_WIDTH / 2) - 100
    button_y = (SCREEN_HEIGHT * 3 / 4)
    button_color = Gosu::Color.new(0xff_4CAF50)
    draw_rect(button_x, button_y, 200, 50, button_color)
    draw_rect(button_x + 2, button_y + 2, 196, 46, Gosu::Color.new(0xff_66BB6A))

    attacker_name = @turn == :bart ? 'Bart' : 'Safa'
    @title_font.draw_text('ATTACK!', button_x + 50, button_y + 13, 1, 1, 1, Gosu::Color::WHITE)

    if @bart_hp <= 0
      @title_font.draw_text('SAFA WINT!', (SCREEN_WIDTH / 2) - 80, SCREEN_HEIGHT / 2, 1, 1, 1, Gosu::Color::RED)
    elsif @safa_hp <= 0
      @title_font.draw_text('BART WINT!', (SCREEN_WIDTH / 2) - 80, SCREEN_HEIGHT / 2, 1, 1, 1, Gosu::Color::RED)
    else
      @font.draw_text("#{attacker_name} beurt druk ATTACK", (SCREEN_WIDTH / 2) - 120, SCREEN_HEIGHT - 80, 1, 1, 1,
                      Gosu::Color::BLACK)
    end

    @font.draw_text('Druk ESC om te sluiten', (SCREEN_WIDTH / 2) - 100, SCREEN_HEIGHT - 50, 1, 1, 1, Gosu::Color::BLACK)
  end

  def draw_card(x_pos, y_pos, name, face, body, legs, stats, quote)
    draw_rect(x_pos, y_pos, 200, 300, Gosu::Color::BLACK)
    draw_rect(x_pos + 3, y_pos + 3, 194, 294, Gosu::Color::WHITE)

    @title_font.draw_text(name, x_pos + 10, y_pos + 10, 1, 1, 1, Gosu::Color::BLACK)

    draw_rect(x_pos + 10, y_pos + 45, 180, 2, Gosu::Color::BLACK)

    @font.draw_text(face, x_pos + 70, y_pos + 80, 1, 1, 1, Gosu::Color::BLACK)
    @font.draw_text(body, x_pos + 75, y_pos + 105, 1, 1, 1, Gosu::Color::BLACK)
    @font.draw_text(legs, x_pos + 75, y_pos + 130, 1, 1, 1, Gosu::Color::BLACK)

    @font.draw_text(stats, x_pos + 10, y_pos + 180, 1, 1, 1, Gosu::Color::BLACK)

    @font.draw_text(quote, x_pos + 10, y_pos + 220, 1, 1, 1, Gosu::Color.new(0xff_800080))
  end

  def draw_rect(x_pos, y_pos, width, height, color)
    Gosu.draw_rect(x_pos, y_pos, width, height, color)
  end

  def button_down(id)
    return close if id == Gosu::KB_ESCAPE
    return unless id == Gosu::MS_LEFT

    # Klik
    x_pos = mouse_x
    y_pos = mouse_y

    button_x = (SCREEN_WIDTH / 2) - 100
    button_y = (SCREEN_HEIGHT * 3 / 4)

    attack if x_pos.between?(button_x, button_x + 200) && y_pos >= button_y && y_pos <= button_y + 50
  end

  def attack
    return if @bart_hp <= 0 || @safa_hp <= 0

    if @turn == :bart
      @safa_hp -= 10
      @safa_hp = 0 if @safa_hp.negative?
      @turn = :safa
    elsif @turn == :safa
      @bart_hp -= 12
      @bart_hp = 0 if @bart_hp.negative?
      @turn = :bart
    end
  end
end

window = CardWindow.new
window.show

# rubocop:enable Metrics/AbcSize, Metrics/ParameterLists, Metrics/MethodLength
