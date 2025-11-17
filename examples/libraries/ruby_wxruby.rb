require 'wx'

class TheFrame < Wx::Frame
  def initialize(title)
    super(nil, title: title)
    panel = Wx::Panel.new(self)
    button = Wx::Button.new(panel, label: 'Click me')
    button.evt_button(Wx::ID_ANY) { Wx.message_box('Hello. Thanks for clicking me!', 'Hello Button sample') }
  end
end

Wx::App.run { TheFrame.new('Hello world!').show }