class Cell
  Z = 1

  def initialize(type, image, height, width)
    @type = type
    @image = image
    @height = height
    @width = width
  end

  def draw
    if @image
      @image.draw(@x * @width, @y * @height, Z)
    end
  end

  def wall?
    @type == :wall
  end

  def park?
    @type == :park
  end

  def sewer?
    @type == :sewer
  end

  def empty?
    @type == :empty
  end

  def blocked?
    wall? || park?
  end

  def bounds
    {
      top: @y * @height,
      bottom: (@y + 1) * @height,
      left: @x * @width,
      right: (@x + 1) * @width
    }
  end

  def set_grid_position(x, y)
    @x = x
    @y = y
  end

end
