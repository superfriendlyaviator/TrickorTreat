require 'gosu'
require 'hasu'
Hasu.load 'player.rb'

class Game < Hasu::Window
  def initialize
    super(640, 480, false)
  end

  def reset
    self.caption = 'Hello World!'
    @background_image = Gosu::Image.new(self, "assets/stars.jpg", true)
    @player = Player.new(self)
    @player.warp(320, 240)
  end

  def update
    if button_down? Gosu::KbLeft
      @player.move_left
    end
    if button_down? Gosu::KbRight
      @player.move_right
    end
    if button_down? Gosu::KbUp
      @player.move_up
    end
    if button_down? Gosu::KbDown
      @player.move_down
    end
  end

  def draw
    @background_image.draw(0,0,0)
    @player.draw
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

Game.run
