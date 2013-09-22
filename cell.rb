class Cell
  Z = 1

  def initialize(image, height, width)
    @image = image
    @height = height
    @width = width
  end

  def draw(x, y)
    if @image
      @image.draw(x * @width, y * @height, Z)
    end
  end

end
