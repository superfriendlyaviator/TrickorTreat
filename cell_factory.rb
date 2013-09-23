Hasu.load "cell.rb"

class CellFactory
  attr_reader :height, :width

  def initialize(window)
    @wall_image = Gosu::Image.new(window, "assets/wall.jpg", true)
    @park_image = Gosu::Image.new(window, "assets/grass.jpg", true)
    @sewer_image = Gosu::Image.new(window, "assets/sewer.png", true)
    @height = 32
    @width = 32
  end

  def wall
    Cell.new(:wall, @wall_image, @height, @width)
  end

  def park
    Cell.new(:park, @park_image, @height, @width)
  end

  def sewer
    Cell.new(:sewer, @sewer_image, @height, @width)
  end

  def empty
    Cell.new(:empty, nil, @height, @width)
  end

end
