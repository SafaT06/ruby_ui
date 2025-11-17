# require 'fxruby'
# include Fox

# class MijnApp < FXMainWindow
#   def initialize(app)
#     super(app, "FXRuby", :width => 300, :height => 150)
    
#     FXButton.new(self, "Klik").connect(SEL_COMMAND) do
#       getApp().exit(0)
#     end
#   end

#   def create
#     super
#     show(PLACEMENT_SCREEN)
#   end
# end

# application = FXApp.new
# MijnApp.new(application)
# application.create
# application.run