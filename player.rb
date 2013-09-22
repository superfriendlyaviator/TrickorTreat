class Player
  def initialize(window)
    @window = window
    @image = Gosu::Image.new(window, "assets/pacman.gif", false)
    @backward_image = Gosu::Image.new(window, "assets/pacman2.gif", false)
    @height = @image.height.to_f
    @width = @image.width.to_f
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @facing = :right
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def move_up
    @y -= 3
    @y = absolute_top if @y < absolute_top
    @facing = :up
  end

  def move_down
    @y += 3
    @y = absolute_bottom if @y > absolute_bottom
    @facing = :down
  end
  
  def move_left
    @x -= 3
    @x = absolute_left if @x < absolute_left
    @facing = :left
  end

  def move_right
    @x += 3
    @x = absolute_right if @x > absolute_right
    @facing = :right
  end

  def draw
    case @facing
    when :left then @backward_image.draw_rot(@x, @y, 1, 0)
    when :right then @image.draw_rot(@x, @y, 1, 0)
    when :up then @image.draw_rot(@x, @y, 1, 270)
    when :down then @image.draw_rot(@x, @y, 1, 90)
    end
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
