require 'wx'

class CardGameFrame < Wx::Frame
  def initialize
    super(nil, title: 'Card Game - WxRuby', size: [600, 400])
    
    @bart_hp = 25
    @safa_hp = 22
    @turn = :bart
    
    panel = Wx::Panel.new(self)
    panel.set_background_colour(Wx::Colour.new(240, 240, 240))
    
    main_sizer = Wx::BoxSizer.new(Wx::VERTICAL)
    
    # Title
    title = Wx::StaticText.new(panel, label: '⚔️  CARD BATTLE GAME  ⚔️')
    title_font = Wx::Font.new(16, Wx::FONTFAMILY_DEFAULT, Wx::FONTSTYLE_NORMAL, Wx::FONTWEIGHT_BOLD)
    title.set_font(title_font)
    main_sizer.add(title, 0, Wx::ALIGN_CENTER | Wx::ALL, 10)
    
    # Cards
    cards_sizer = Wx::BoxSizer.new(Wx::HORIZONTAL)
    
    # Bart Card
    bart_box = Wx::StaticBox.new(panel, label: 'BART')
    bart_box.set_background_colour(Wx::Colour.new(200, 255, 200))
    bart_sizer = Wx::StaticBoxSizer.new(bart_box, Wx::VERTICAL)
    
    @bart_hp_label = Wx::StaticText.new(panel, label: "❤️  HP: #{@bart_hp}")
    bart_sizer.add(@bart_hp_label, 0, Wx::ALL, 5)
    bart_sizer.add(Wx::StaticText.new(panel, label: "⚡ POW: 10"), 0, Wx::ALL, 5)
    bart_sizer.add(Wx::StaticText.new(panel, label: "( o_o )"), 0, Wx::ALL, 5)
    bart_sizer.add(Wx::StaticText.new(panel, label: '<\|/>'), 0, Wx::ALL, 5)
    bart_sizer.add(Wx::StaticText.new(panel, label: '/   \\'), 0, Wx::ALL, 5)
    bart_sizer.add(Wx::StaticText.new(panel, label: '"Let\'s code!"'), 0, Wx::ALL, 5)
    
    cards_sizer.add(bart_sizer, 1, Wx::ALL | Wx::EXPAND, 10)
    
    # Safa Card
    safa_box = Wx::StaticBox.new(panel, label: 'SAFA')
    safa_box.set_background_colour(Wx::Colour.new(255, 200, 200))
    safa_sizer = Wx::StaticBoxSizer.new(safa_box, Wx::VERTICAL)
    
    @safa_hp_label = Wx::StaticText.new(panel, label: "❤️  HP: #{@safa_hp}")
    safa_sizer.add(@safa_hp_label, 0, Wx::ALL, 5)
    safa_sizer.add(Wx::StaticText.new(panel, label: "⚡ POW: 12"), 0, Wx::ALL, 5)
    safa_sizer.add(Wx::StaticText.new(panel, label: "( ^_^ )"), 0, Wx::ALL, 5)
    safa_sizer.add(Wx::StaticText.new(panel, label: '<\|/>'), 0, Wx::ALL, 5)
    safa_sizer.add(Wx::StaticText.new(panel, label: '/   \\'), 0, Wx::ALL, 5)
    safa_sizer.add(Wx::StaticText.new(panel, label: '"Game on!"'), 0, Wx::ALL, 5)
    
    cards_sizer.add(safa_sizer, 1, Wx::ALL | Wx::EXPAND, 10)
    
    main_sizer.add(cards_sizer, 1, Wx::EXPAND)
    
    # Status
    @status_label = Wx::StaticText.new(panel, label: "🎮 #{@turn == :bart ? 'Bart' : 'Safa'}'s beurt")
    main_sizer.add(@status_label, 0, Wx::ALIGN_CENTER | Wx::ALL, 10)
    
    # Attack Button
    attack_button = Wx::Button.new(panel, label: '⚔️  ATTACK!  ⚔️')
    attack_button.set_background_colour(Wx::Colour.new(76, 175, 80))
    attack_button.set_foreground_colour(Wx::WHITE)
    attack_button.evt_button(Wx::ID_ANY) { on_attack }
    main_sizer.add(attack_button, 0, Wx::ALIGN_CENTER | Wx::ALL, 10)
    
    # Tip
    tip = Wx::StaticText.new(panel, label: '💡 Tip: Klik ATTACK om te vechten!')
    main_sizer.add(tip, 0, Wx::ALIGN_CENTER | Wx::ALL, 5)
    
    panel.set_sizer(main_sizer)
    centre
  end
  
  def on_attack
    return if @bart_hp <= 0 || @safa_hp <= 0
    
    if @turn == :bart
      @safa_hp -= 10
      @safa_hp = 0 if @safa_hp < 0
      @turn = :safa
    else
      @bart_hp -= 12
      @bart_hp = 0 if @bart_hp < 0
      @turn = :bart
    end
    
    @bart_hp_label.set_label("❤️  HP: #{@bart_hp}")
    @safa_hp_label.set_label("❤️  HP: #{@safa_hp}")
    
    if @bart_hp <= 0
      @status_label.set_label('🏆 SAFA WINT! 🏆')
    elsif @safa_hp <= 0
      @status_label.set_label('🏆 BART WINT! 🏆')
    else
      @status_label.set_label("🎮 #{@turn == :bart ? 'Bart' : 'Safa'}'s beurt")
    end
  end
end

Wx::App.run { CardGameFrame.new.show }