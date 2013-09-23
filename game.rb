require 'gosu'
require 'hasu'
require 'pry'
Hasu.load 'player.rb'
Hasu.load 'map.rb'

class Game < Hasu::Window
  def initialize
    super(640, 480, false)
  end

  def reset
    self.caption = 'Hello World!'
    @map = Map.new(self)
    @player = Player.new(self, @map)
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
    draw_background
    @map.draw
    @player.draw
  end

  TOP_COLOR = Gosu::Color.new(0xFF1EB1FA)
  BOTTOM_COLOR = Gosu::Color.new(0xFF1D4DB5)
  def draw_background
    draw_quad(
     0,     0,      TOP_COLOR,
     width, 0,      TOP_COLOR,
     0,     height, BOTTOM_COLOR,
     width, height, BOTTOM_COLOR,
     0)
  end

  def button_down(id)
    if id == Gosu::KbEscape
      close
    end
  end
end

Game.run
