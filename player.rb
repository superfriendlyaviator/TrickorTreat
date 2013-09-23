class Player
  Z = 10
  SPEED = 3

  attr_reader :x, :y

  def initialize(window, map)
    @window = window
    @map = map
    @image = Gosu::Image.new(window, "assets/pacman.gif", false)
    @backward_image = Gosu::Image.new(window, "assets/pacman2.gif", false)
    @height = @image.height.to_f
    @width = @image.width.to_f
    @x = @y = @angle = 0.0
    @facing = :right
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move_up
    @y -= SPEED
    SPEED.times do
      break unless @map.wall_collision?(self)
      @y += 1
    end
    @y = absolute_top if @y < absolute_top
    @facing = :up
  end

  def move_down
    @y += SPEED
    SPEED.times do
      break unless @map.wall_collision?(self)
      @y -= 1
    end
    @y = absolute_bottom if @y > absolute_bottom
    @facing = :down
  end
  
  def move_left
    @x -= SPEED
    SPEED.times do
      break unless @map.wall_collision?(self)
      @x += 1
    end
    @x = absolute_left if @x < absolute_left
    @facing = :left
  end

  def move_right
    @x += SPEED
    SPEED.times do
      break unless @map.wall_collision?(self)
      @x -= 1
    end
    @x = absolute_right if @x > absolute_right
    @facing = :right
  end

  def draw
    case @facing
    when :left then @backward_image.draw_rot(@x, @y, Z, 0)
    when :right then @image.draw_rot(@x, @y, Z, 0)
    when :up then @image.draw_rot(@x, @y, Z, 270)
    when :down then @image.draw_rot(@x, @y, Z, 90)
    end
  end

  def bounds
    {
      top: @y - @height / 2,
      bottom: @y + @height / 2,
      left: @x - @width / 2,
      right: @x + @width / 2
    }
  end

  def absolute_top
    0 + @height / 2
  end

  def absolute_bottom
    @window.height - @height / 2
  end

  def absolute_left
    0 + @width / 2
  end

  def absolute_right
    @window.width - @width / 2
  end

end
