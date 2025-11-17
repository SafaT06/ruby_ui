require 'glimmer-dsl-libui'

include Glimmer

@bart_hp = 25
@safa_hp = 22
@turn = :bart

window('Card Game - Glimmer', 700, 500) {
  margined true
  
  vertical_box {
    # Title
    label('⚔️  CARD BATTLE GAME  ⚔️') {
      stretchy false
    }
    
    horizontal_separator {
      stretchy false
    }
    
    label('') # spacer
    
    horizontal_box {
      stretchy false
      
      # Bart Card
      group('BART') {
        vertical_box {
          @bart_label = label("❤️  HP: #{@bart_hp}") {
            stretchy false
          }
          label("⚡ POW: 10") {
            stretchy false
          }
          label('') # spacer
          label('( o_o )') {
            stretchy false
          }
          label('<\\|/>') {
            stretchy false
          }
          label('/   \\') {
            stretchy false
          }
          label('') # spacer
          label('"Let\'s code!"') {
            stretchy false
          }
        }
      }
      
      label('        ') # spacer between cards
      
      # Safa Card
      group('SAFA') {
        vertical_box {
          @safa_label = label("❤️  HP: #{@safa_hp}") {
            stretchy false
          }
          label("⚡ POW: 12") {
            stretchy false
          }
          label('') # spacer
          label('( ^_^ )') {
            stretchy false
          }
          label('<\\|/>') {
            stretchy false
          }
          label('/   \\') {
            stretchy false
          }
          label('') # spacer
          label('"Game on!"') {
            stretchy false
          }
        }
      }
    }
    
    label('') # spacer
    horizontal_separator {
      stretchy false
    }
    
    @status = label("🎮 #{@turn == :bart ? 'Bart' : 'Safa'}'s beurt") {
      stretchy false
    }
    
    label('') # spacer
    
    button('⚔️  ATTACK!  ⚔️') {
      stretchy false
      
      on_clicked do
        if @bart_hp > 0 && @safa_hp > 0
          if @turn == :bart
            @safa_hp -= 10
            @safa_hp = 0 if @safa_hp < 0
            @turn = :safa
          else
            @bart_hp -= 12
            @bart_hp = 0 if @bart_hp < 0
            @turn = :bart
          end
          
          # Update labels
          @bart_label.text = "❤️  HP: #{@bart_hp}"
          @safa_label.text = "❤️  HP: #{@safa_hp}"
          
          if @bart_hp <= 0
            @status.text = '🏆 SAFA WINT! 🏆'
          elsif @safa_hp <= 0
            @status.text = '🏆 BART WINT! 🏆'
          else
            @status.text = "🎮 #{@turn == :bart ? 'Bart' : 'Safa'}'s beurt"
          end
        end
      end
    }
    
    label('') # spacer
    label('💡 Tip: Klik ATTACK om te vechten!') {
      stretchy false
    }
  }
}.show