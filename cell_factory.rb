Hasu.load "cell.rb"

class CellFactory
  attr_reader :height, :width

  def initialize(window)
    @wall_image = Gosu::Image.new(window, "assets/wall.jpg", true)
    @height = 32
    @width = 32
  end

  def wall
    Cell.new(@wall_image, @height, @width)
  end

  def empty
    Cell.new(nil, @height, @width)
  end

end
